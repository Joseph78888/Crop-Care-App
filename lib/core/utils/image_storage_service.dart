import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

/// Service for managing image storage in permanent app directory
/// Prevents images from being deleted by OS cache cleanup
class ImageStorageService {
  /// Copy image from temporary location to permanent app storage
  /// Returns the new permanent path
  static Future<String> saveImagePermanently(String tempPath) async {
    try {
      // Get permanent app documents directory
      final appDir = await getApplicationDocumentsDirectory();
      
      // Create images subdirectory if it doesn't exist
      final imagesDir = Directory('${appDir.path}/analysis_images');
      if (!await imagesDir.exists()) {
        await imagesDir.create(recursive: true);
      }
      
      // Generate unique filename using timestamp
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final extension = path.extension(tempPath);
      final fileName = 'img_$timestamp$extension';
      
      // Full path for permanent storage
      final permanentPath = '${imagesDir.path}/$fileName';
      
      // Copy file from temp to permanent location
      final tempFile = File(tempPath);
      await tempFile.copy(permanentPath);
      
      return permanentPath;
    } catch (e) {
      // If copy fails, return original path as fallback
      // (Better to have temp image than no image)
      return tempPath;
    }
  }
  
  /// Delete an image file (optional - for cleanup)
  static Future<void> deleteImage(String imagePath) async {
    try {
      final file = File(imagePath);
      if (await file.exists()) {
        await file.delete();
      }
    } catch (_) {
      // Ignore deletion errors
    }
  }
  
  /// Get total size of stored images (optional - for monitoring)
  static Future<int> getTotalImagesSize() async {
    try {
      final appDir = await getApplicationDocumentsDirectory();
      final imagesDir = Directory('${appDir.path}/analysis_images');
      
      if (!await imagesDir.exists()) return 0;
      
      int totalSize = 0;
      await for (var entity in imagesDir.list()) {
        if (entity is File) {
          totalSize += await entity.length();
        }
      }
      return totalSize;
    } catch (_) {
      return 0;
    }
  }
}
