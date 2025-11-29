import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '/presentation/screens/image_preview_screen.dart';
import '/presentation/providers/image_provider.dart';

class UploadeContainer extends ConsumerStatefulWidget {
  const UploadeContainer({super.key});

  @override
  ConsumerState<UploadeContainer> createState() => _UploadeContainerState();
}

class _UploadeContainerState extends ConsumerState<UploadeContainer> {
   void _uploadeImage() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
      maxWidth: 1000,
    );

    if (pickedImage == null) {
      return;
    }

    ref.read(selectedImageProvider.notifier).state = File(pickedImage.path);

    if (mounted) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const ImagePreviewScreen(),
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _uploadeImage,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFEAB308),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.upload),
            SizedBox(width: 8),
            Text('Upload from Gallery', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
