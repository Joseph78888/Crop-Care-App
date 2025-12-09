import 'dart:io';

import 'package:crop_care_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '/presentation/screens/image_preview_screen.dart';
import '/presentation/providers/image_provider.dart';
import '/core/utils/image_storage_service.dart';

class CaptureContainer extends ConsumerStatefulWidget {
  const CaptureContainer({super.key});

  @override
  ConsumerState<CaptureContainer> createState() => _CaptureContainerState();
}

class _CaptureContainerState extends ConsumerState<CaptureContainer> {
  void _pickImage() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 100,
      maxWidth: 1000,
    );

    if (pickedImage == null) {
      return;
    }

    // Copy image to permanent storage to prevent OS cleanup
    final permanentPath = await ImageStorageService.saveImagePermanently(
      pickedImage.path,
    );

    ref.read(selectedImageProvider.notifier).state = File(permanentPath);

    if (mounted) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const ImagePreviewScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _pickImage,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.camera_alt),
            SizedBox(width: 8),
            Text(S.of(context).captureImage, style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
