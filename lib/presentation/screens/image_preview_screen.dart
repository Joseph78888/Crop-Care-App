import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/presentation/screens/capture_tips_screen.dart';
import '/presentation/screens/result_screen.dart';
import '/presentation/widgets/capture_image.dart';
import '/presentation/providers/history_provider.dart';

class ImagePreviewScreen extends ConsumerWidget {
  const ImagePreviewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(

      backgroundColor: const Color.fromARGB(255, 234, 255, 235),
      appBar: AppBar(title: Text('Analyze Your Crop'),backgroundColor: Colors.transparent, ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Image Preview
            Expanded(
              child: Card(
                // shape: BeveledRectangleBorder(borderRadius: BorderRadiusGeometry.circular(20)),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Hero(
                      tag: 'preview-image',
                      child: InteractiveViewer(
                        panEnabled: true,
                        minScale: 1.0,
                        maxScale: 4.0,
                        child: Image.file(
                          image!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                                color: Colors.grey[200],
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.broken_image,
                                      size: 48,
                                      color: Colors.grey[600],
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'Image not available',
                                      style: TextStyle(color: Colors.grey[700]),
                                    ),
                                  ],
                                ),
                              ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Analysis Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  // TODO: replace this simulated prediction with real model inference
                  const predictedLabel = 'Early Blight';
                  const confidence = 0.87;
                  final status = statusFromModel(predictedLabel: predictedLabel, confidence: confidence);

                  // Add to history and set current result
                  await ref.read(historyProvider.notifier).add(
                    imagePath: image!.path,
                    diseaseName: predictedLabel,
                    status: status,
                    confidence: confidence,
                  );

                  // set current result for ResultScreen
                  final latest = ref.read(historyProvider).first;
                  ref.read(currentResultProvider.notifier).state = latest;

                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => const ResultScreen()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.psychology_rounded),
                    SizedBox(width: 8),
                    Text('Analyze Disease', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Choose Different Image Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => CaptureTipsScreen()),
                  );
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.image),
                    SizedBox(width: 8),
                    Text(
                      'Choose Different Image',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
