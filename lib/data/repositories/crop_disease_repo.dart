import 'dart:io';
import 'package:flutter/material.dart';

import '../datasources/ai_local_ds.dart';
import '../datasources/disease_database.dart';
import '../models/disease_info_model.dart';

/// Repository for crop disease detection and information
class CropDiseaseRepository {
  final TFLiteService _tfliteService;

  CropDiseaseRepository(this._tfliteService);

  /// Initialize the repository (loads the model)
  Future<void> initialize() async {
    await _tfliteService.initialize();
  }

  /// Analyze an image and return disease information with prediction
  Future<Map<String, dynamic>> analyzeImage(File imageFile) async {
    try {
      // Run model inference
      final prediction = await _tfliteService.analyzeImage(imageFile);
      
      final String predictedLabel = prediction['label'];
      final double confidence = prediction['confidence'];

      // Get disease information from database
      final DiseaseInfo? diseaseInfo = DiseaseDatabase.getDiseaseInfo(predictedLabel);

      if (diseaseInfo == null) {
        throw Exception('Disease information not found for: $predictedLabel');
      }

      return {
        'diseaseName': diseaseInfo.displayName,
        'diseaseLabel': predictedLabel,
        'confidence': confidence,
        'diseaseInfo': diseaseInfo,
        'isHealthy': diseaseInfo.isHealthy,
      };
    } catch (e) {
      debugPrint('Error in CropDiseaseRepository.analyzeImage: $e');
      rethrow;
    }
  }

  /// Get disease information by name
  DiseaseInfo? getDiseaseInfo(String diseaseName) {
    return DiseaseDatabase.getDiseaseInfo(diseaseName);
  }

  /// Check if service is ready
  bool get isReady => _tfliteService.isInitialized;

  /// Dispose of resources
  void dispose() {
    _tfliteService.dispose();
  }
}
