import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/ai_local_ds.dart';
import '../../data/repositories/crop_disease_repo.dart';

/// Provider for TFLite service (singleton)
final tfliteServiceProvider = Provider<TFLiteService>((ref) {
  final service = TFLiteService();
  ref.onDispose(() {
    service.dispose();
  });
  return service;
});

/// Provider for crop disease repository
final cropDiseaseRepositoryProvider = Provider<CropDiseaseRepository>((ref) {
  final tfliteService = ref.watch(tfliteServiceProvider);
  final repository = CropDiseaseRepository(tfliteService);
  ref.onDispose(() {
    repository.dispose();
  });
  return repository;
});

/// Provider to track model initialization state
final modelInitializationProvider = FutureProvider<bool>((ref) async {
  final repository = ref.watch(cropDiseaseRepositoryProvider);
  await repository.initialize();
  return true;
});
