import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:crop_care_app/generated/l10n.dart';
import '/presentation/screens/capture_tips_screen.dart';
import '/presentation/screens/result_screen.dart';
import '/presentation/providers/history_provider.dart';
import '/presentation/providers/disease_provider.dart';
import '/presentation/providers/image_provider.dart';
import '/data/models/detection_result.dart';
import '/core/utils/responsive_helper.dart';

class ImagePreviewScreen extends ConsumerWidget {
  const ImagePreviewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageFile = ref.watch(selectedImageProvider);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 234, 255, 235),
      appBar: AppBar(
        title: Builder(
          builder: (context) {
            return Text(S.of(context).analyzeYourCrop);
          },
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.all(context.responsive.md),
        child: Column(
          children: [
            // Image Preview
            Expanded(
              child: Card(
                child: SizedBox(
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(context.responsive.md),
                    child: Hero(
                      tag: 'preview-image',
                      child: InteractiveViewer(
                        panEnabled: true,
                        minScale: 1.0,
                        maxScale: 4.0,
                        child: imageFile != null
                            ? Image.file(
                                imageFile,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              )
                            : Builder(
                                builder: (context) {
                                  return Container(
                                    color: Colors.grey[200],
                                    alignment: Alignment.center,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.image_not_supported,
                                          size: context.responsive.rs(48),
                                          color: Colors.grey,
                                        ),
                                        SizedBox(height: context.responsive.sm),
                                        Text(
                                          S.of(context).noImageSelected,
                                          style: const TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
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
                onPressed: imageFile == null
                    ? null
                    : () async {
                        // Show loading dialog
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (ctx) => Builder(
                            builder: (context) {
                              return Center(
                                child: Card(
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                      context.responsive.lg,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const CircularProgressIndicator(),
                                        SizedBox(height: context.responsive.md),
                                        Text(
                                          S.of(context).analyzingImage,
                                          style: TextStyle(
                                            fontSize: context.responsive.textMD,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );

                        try {
                          // Get the disease repository
                          final repository = ref.read(
                            cropDiseaseRepositoryProvider,
                          );

                          // Ensure model is initialized
                          if (!repository.isReady) {
                            await repository.initialize();
                          }

                          // Run model inference
                          final result = await repository.analyzeImage(
                            imageFile,
                          );

                          // Extract results
                          final String diseaseName = result['diseaseName'];
                          final double confidence = result['confidence'];
                          final bool isHealthy = result['isHealthy'];
                          final status = isHealthy
                              ? HealthStatus.healthy
                              : HealthStatus.diseased;

                          // Add to history and set current result
                          await ref
                              .read(historyProvider.notifier)
                              .add(
                                imagePath: imageFile.path,
                                diseaseName: diseaseName,
                                status: status,
                                confidence: confidence,
                              );

                          // Set current result for ResultScreen
                          final latest = ref.read(historyProvider).first;
                          ref.read(currentResultProvider.notifier).state =
                              latest;

                          // Close loading dialog
                          if (context.mounted) Navigator.of(context).pop();

                          // Navigate to result screen
                          if (context.mounted) {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (ctx) => const ResultScreen(),
                              ),
                            );
                          }
                        } catch (e) {
                          // Close loading dialog
                          if (context.mounted) Navigator.of(context).pop();

                          // Show error dialog
                          if (context.mounted) {
                            showDialog(
                              context: context,
                              builder: (ctx) => Builder(
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(S.of(context).analysisFailed),
                                    content: Text(
                                      '${S.of(context).analysisFailedMessage}\n\n${S.of(context).error}: $e',
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(ctx).pop(),
                                        child: Text(S.of(context).ok),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            );
                          }
                        }
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(
                    vertical: context.responsive.md,
                  ),
                ),
                child: Builder(
                  builder: (context) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.psychology_rounded),
                        SizedBox(width: context.responsive.sm),
                        Text(
                          S.of(context).analyzeDisease,
                          style: TextStyle(fontSize: context.responsive.textMD),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: context.responsive.md),

            // Choose Different Image Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => const CaptureTipsScreen(),
                    ),
                  );
                },
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    vertical: context.responsive.md,
                  ),
                ),
                child: Builder(
                  builder: (context) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.image),
                        SizedBox(width: context.responsive.sm),
                        Text(
                          S.of(context).chooseDifferentImage,
                          style: TextStyle(fontSize: context.responsive.textMD),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: context.responsive.md),
          ],
        ),
      ),
    );
  }
}
