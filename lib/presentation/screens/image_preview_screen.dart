import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/presentation/screens/capture_tips_screen.dart';
import '/presentation/screens/result_screen.dart';
import '/presentation/widgets/capture_image.dart';
import '/presentation/providers/history_provider.dart';
import '/presentation/providers/disease_provider.dart';
import '/data/models/detection_result.dart';

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
                  // Show loading dialog
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (ctx) => const Center(
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircularProgressIndicator(),
                              SizedBox(height: 16),
                              Text(
                                'Analyzing image...',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );

                  try {
                    // Get the disease repository
                    final repository = ref.read(cropDiseaseRepositoryProvider);

                    // Ensure model is initialized
                    if (!repository.isReady) {
                      await repository.initialize();
                    }

                    // Run model inference
                    final result = await repository.analyzeImage(image!);

                    // Extract results
                    final String diseaseName = result['diseaseName'];
                    final double confidence = result['confidence'];
                    final bool isHealthy = result['isHealthy'];
                    final status = isHealthy ? HealthStatus.healthy : HealthStatus.diseased;

                    // Add to history and set current result
                    await ref.read(historyProvider.notifier).add(
                      imagePath: image!.path,
                      diseaseName: diseaseName,
                      status: status,
                      confidence: confidence,
                    );

                    // Set current result for ResultScreen
                    final latest = ref.read(historyProvider).first;
                    ref.read(currentResultProvider.notifier).state = latest;

                    // Close loading dialog
                    if (context.mounted) Navigator.of(context).pop();

                    // Navigate to result screen
                    if (context.mounted) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (ctx) => const ResultScreen()),
                      );
                    }
                  } catch (e) {
                    // Close loading dialog
                    if (context.mounted) Navigator.of(context).pop();

                    // Show error dialog
                    if (context.mounted) {
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: const Text('Analysis Failed'),
                          content: Text(
                            'Failed to analyze the image. Please try again.\n\nError: $e',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(ctx).pop(),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }
                  }
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
