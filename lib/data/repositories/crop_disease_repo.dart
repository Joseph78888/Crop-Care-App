import '../datasources/ai_local_ds.dart';
import '../datasources/api_remote_ds.dart';
import '../datasources/db_local_ds.dart';

class CropDiseaseRepository {
  final AiLocalDataSource aiLocalDataSource;
  final ApiRemoteDataSource apiRemoteDataSource;
  final DbLocalDataSource dbLocalDataSource;

  CropDiseaseRepository({required this.aiLocalDataSource, required this.apiRemoteDataSource, required this.dbLocalDataSource});

  Future<String> diagnose(String imagePath) async {
    final String local = await aiLocalDataSource.runInferenceOnImagePath(imagePath);
    await dbLocalDataSource.saveHistoryItem(local);
    return local;
  }

  Future<List<String>> history() => dbLocalDataSource.fetchHistory();
}


