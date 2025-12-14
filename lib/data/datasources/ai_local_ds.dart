import 'dart:developer';
import 'dart:io';

import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;


/// TensorFlow Lite service for tomato disease detection
class TFLiteService {
  Interpreter? _interpreter;
  List<String>? _labels;
  bool _isInitialized = false;

  static const String _modelPath = 'assets/models/tomato_model.tflite';
  static const String _labelsPath = 'assets/models/labels.txt';
  static const int _inputSize = 300; // Updated to match model input shape
  static const int _numChannels = 3; // RGB

  static const double _confidenceThreshold = 0.79; // 79% threshold

  /// Initialize the TFLite model and load labels
  Future<void> initialize() async {
    if (_isInitialized) return;

    try {
      // Load the model
      _interpreter = await Interpreter.fromAsset(_modelPath);

      // Load labels
      final labelsData = await rootBundle.loadString(_labelsPath);
      // Load labels and ensure they are trimmed (removes \r from Windows line endings)
      _labels = labelsData
          .split('\n')
          .map((l) => l.trim())
          .where((l) => l.isNotEmpty)
          .toList();

      _isInitialized = true;
      log('TFLite model initialized successfully');
      log('Model input shape: ${_interpreter!.getInputTensors()}');
      log('Model output shape: ${_interpreter!.getOutputTensors()}');
      log('Loaded ${_labels!.length} labels');

      // Log the specific shape of the first output tensor
      var outputTensor = _interpreter!.getOutputTensor(0);
      log('Output tensor 0 shape: ${outputTensor.shape}');
      log('Output tensor 0 type: ${outputTensor.type}');
    } catch (e) {
      log('Error initializing TFLite model: $e');
      rethrow;
    }
  }

  /// Analyze an image and return the predicted disease and confidence
  Future<Map<String, dynamic>> analyzeImage(File imageFile) async {
    if (!_isInitialized) {
      throw Exception('TFLite model not initialized. Call initialize() first.');
    }

    try {
      // Read and decode the image
      final imageBytes = await imageFile.readAsBytes();
      img.Image? image = img.decodeImage(imageBytes);

      if (image == null) {
        throw Exception('Failed to decode image');
      }

      // Resize image to model input size
      img.Image resizedImage = img.copyResize(
        image,
        width: _inputSize,
        height: _inputSize,
      );

      // Convert image to input tensor format [1, 224, 224, 3] as Uint8
      var input = _imageToByteListUint8(resizedImage);

      // Reshape input to 4D tensor
      var inputReshaped = input.reshape([
        1,
        _inputSize,
        _inputSize,
        _numChannels,
      ]);

      // Get output tensor shape from the model
      var outputTensor = _interpreter!.getOutputTensor(0);
      var outputShape = outputTensor.shape;

      // Calculate total elements in output
      int totalElements = 1;
      for (var s in outputShape) {
        if (s > 0) {
          totalElements *=
              s; // Handle dynamic dimensions if represented as -1, though usually fixed at runtime
        }
      }

      // If the first dimension is 1 (batch size), we might want to ignore it for total count calculation if we just want the features
      // But for safety, let's just allocate a flat buffer or a shaped buffer.
      // TFLite Flutter run usually expects the buffer to match the shape or be flat.
      // Let's try to allocate a buffer matching the shape.

      // We need to handle the case where outputShape might be [1, 10, 10] or [1, 16] etc.
      // Since we don't know the exact rank, let's use a flattened buffer approach if possible,
      // or just allocate a multi-dimensional list if we can easily construct it.
      // However, `run` expects a specific structure.

      // EASIER APPROACH: Allocate a flat Float32List (or similar) and reshape if needed,
      // BUT `interpreter.run` takes `Object input, Object output`.
      // If we pass a pre-allocated buffer of the wrong shape, it might fail.

      // Let's try to infer the structure.
      // If shape is [1, 10, 10], we should pass List<List<List<double>>> or a flat buffer and use runForMultipleInputs if needed?
      // Actually `run` usually handles a map or a list.

      // Let's try to use a flat buffer and `run` with a single output buffer.
      // If the output is [1, 10, 10], it effectively contains 100 numbers.

      // We will use a flattened list for the output to make it easier to process
      // Model output is uint8, so use Uint8List
      var outputBuffer = Uint8List(totalElements).reshape(outputShape);

      // Run inference
      _interpreter!.run(inputReshaped, outputBuffer);

      // Flatten the output to find the max
      List<double> predictions = [];

      // Helper to flatten dynamic list
      void flatten(dynamic list) {
        if (list is List) {
          for (var item in list) {
            flatten(item);
          }
        } else if (list is num) {
          // Convert uint8 (0-255) to probability (0.0-1.0)
          predictions.add(list.toDouble() / 255.0);
        }
      }

      flatten(outputBuffer);

      log(
        'Raw model output (flattened, first 20): ${predictions.take(20).toList()}',
      );
      log('Total predictions count: ${predictions.length}');

      // Find the class with highest confidence
      double maxConfidence = 0.0;
      int maxIndex = 0;

      // If we have more predictions than labels, we might be looking at a feature map or incorrect model.
      // But we will try to match the first N predictions to N labels.
      int limit = predictions.length < _labels!.length
          ? predictions.length
          : _labels!.length;

      for (int i = 0; i < limit; i++) {
        if (predictions[i] > maxConfidence) {
          maxConfidence = predictions[i];
          maxIndex = i;
        }
      }

      // Ensure we have enough labels
      if (maxIndex >= _labels!.length) {
        log(
          'Warning: Model output index $maxIndex exceeds label count ${_labels!.length}',
        );
        maxIndex = 0; // Fallback to first label
      }

      String predictedLabel = _labels![maxIndex];

      // Check confidence threshold
      // Check confidence threshold
      if (maxConfidence < _confidenceThreshold) {
        log(
          'Confidence $maxConfidence is below threshold $_confidenceThreshold. Returning Unknown.',
        );
        predictedLabel = 'Unknown';
      }

      // Log top 3 predictions for debugging
      final sortedIndices = List.generate(predictions.length, (i) => i)
        ..sort((a, b) => predictions[b].compareTo(predictions[a]));

      log('Top 3 Predictions:');
      for (int i = 0; i < 3 && i < sortedIndices.length; i++) {
        final idx = sortedIndices[i];
        if (idx < _labels!.length) {
          log(
            '${i + 1}. ${_labels![idx]}: ${(predictions[idx] * 100).toStringAsFixed(2)}%',
          );
        }
      }

      log(
        'Prediction: $predictedLabel with confidence: ${(maxConfidence * 100).toStringAsFixed(2)}%',
      );

      return {
        'label': predictedLabel,
        'confidence': maxConfidence,
        'allPredictions': Map.fromIterables(
          _labels!.take(predictions.length),
          predictions,
        ),
      };
    } catch (e) {
      log('Error during image analysis: $e');
      rethrow;
    }
  }

  /// Convert image to Uint8 byte list for model input (0-255 range)
  Uint8List _imageToByteListUint8(img.Image image) {
    var convertedBytes = Uint8List(1 * _inputSize * _inputSize * _numChannels);
    int pixelIndex = 0;

    for (int y = 0; y < _inputSize; y++) {
      for (int x = 0; x < _inputSize; x++) {
        final pixel = image.getPixel(x, y);

        // Keep pixel values in [0, 255] range as uint8
        convertedBytes[pixelIndex++] = pixel.r.toInt();
        convertedBytes[pixelIndex++] = pixel.g.toInt();
        convertedBytes[pixelIndex++] = pixel.b.toInt();
      }
    }

    return convertedBytes;
  }

  /// Check if the service is initialized
  bool get isInitialized => _isInitialized;

  /// Get the list of labels
  List<String>? get labels => _labels;

  /// Dispose of resources
  void dispose() {
    _interpreter?.close();
    _interpreter = null;
    _labels = null;
    _isInitialized = false;
    log('TFLite service disposed');
  }
}
