import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as img;

/// TensorFlow Lite service for tomato disease detection
class TFLiteService {
  Interpreter? _interpreter;
  List<String>? _labels;
  bool _isInitialized = false;

  static const String _modelPath = 'assets/models/tomato_model.tflite';
  static const String _labelsPath = 'assets/models/labels.txt';
  static const int _inputSize = 224; // Standard input size for most models
  static const int _numChannels = 3; // RGB

  /// Initialize the TFLite model and load labels
  Future<void> initialize() async {
    if (_isInitialized) return;

    try {
      // Load the model
      _interpreter = await Interpreter.fromAsset(_modelPath);
      
      // Load labels
      final labelsData = await rootBundle.loadString(_labelsPath);
      _labels = labelsData.split('\n').where((label) => label.trim().isNotEmpty).toList();

      _isInitialized = true;
      print('TFLite model initialized successfully');
      print('Model input shape: ${_interpreter!.getInputTensors()}');
      print('Model output shape: ${_interpreter!.getOutputTensors()}');
      print('Loaded ${_labels!.length} labels');
    } catch (e) {
      print('Error initializing TFLite model: $e');
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

      // Convert image to input tensor format
      var input = _imageToByteListFloat32(resizedImage);

      // Prepare output buffer
      var output = List.filled(1, List.filled(_labels!.length, 0.0)).cast<List<double>>();

      // Run inference
      _interpreter!.run(input, output);

      // Get the results
      final predictions = output[0];
      
      // Find the class with highest confidence
      double maxConfidence = 0.0;
      int maxIndex = 0;
      
      for (int i = 0; i < predictions.length; i++) {
        if (predictions[i] > maxConfidence) {
          maxConfidence = predictions[i];
          maxIndex = i;
        }
      }

      final predictedLabel = _labels![maxIndex];
      
      print('Prediction: $predictedLabel with confidence: ${(maxConfidence * 100).toStringAsFixed(2)}%');

      return {
        'label': predictedLabel,
        'confidence': maxConfidence,
        'allPredictions': Map.fromIterables(_labels!, predictions),
      };
    } catch (e) {
      print('Error during image analysis: $e');
      rethrow;
    }
  }

  /// Convert image to Float32 byte list for model input
  Float32List _imageToByteListFloat32(img.Image image) {
    var convertedBytes = Float32List(1 * _inputSize * _inputSize * _numChannels);
    var buffer = Float32List.view(convertedBytes.buffer);
    int pixelIndex = 0;

    for (int y = 0; y < _inputSize; y++) {
      for (int x = 0; x < _inputSize; x++) {
        final pixel = image.getPixel(x, y);
        
        // Normalize pixel values to [0, 1] range
        buffer[pixelIndex++] = pixel.r / 255.0;
        buffer[pixelIndex++] = pixel.g / 255.0;
        buffer[pixelIndex++] = pixel.b / 255.0;
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
    print('TFLite service disposed');
  }
}
