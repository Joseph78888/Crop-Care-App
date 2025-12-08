import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:crop_care_app/generated/l10n.dart';
import '/presentation/providers/image_provider.dart';
import '/presentation/screens/tabs_screen.dart';
import '/presentation/widgets/gradient_scaffold.dart';
import '/presentation/providers/history_provider.dart';
import '/data/models/detection_result.dart';
import '/data/datasources/disease_database.dart';
import '/data/models/disease_info_model.dart';
import '/core/utils/responsive_helper.dart';

class ResultScreen extends ConsumerStatefulWidget {
  const ResultScreen({super.key});

  @override
  ConsumerState<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends ConsumerState<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    // STEP 3: Retrieving Data
    // The ResultScreen watches the currentResultProvider to get the detection result.
    // This provider is set by:
    // 1. The ImagePreviewScreen after fresh AI analysis, OR
    // 2. The HistoryCard when a user taps a historical record
    // By using a provider instead of route parameters, we have a single source of truth.
    final DetectionResult? current = ref.watch(currentResultProvider);
    final image = ref.watch(selectedImageProvider);

    return GradientScaffold(
      appBar: AppBar(
        title: Builder(
          builder: (context) {
            return Text(S.of(context).analyzeResult);
          },
        ),
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(context.responsive.md),
            child: Column(
              children: [
                Card(
                  // shape: BeveledRectangleBorder(borderRadius: BorderRadiusGeometry.circular(20)),
                  child: SizedBox(
                    height: context.responsive.hp(37),
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        context.responsive.md,
                      ),
                      child: Hero(
                        tag: 'preview-image',
                        child: current != null
                            ? Image.file(
                                File(current.imagePath),
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                                alignment: Alignment.center,
                                errorBuilder: (context, error, stackTrace) =>
                                    Builder(
                                      builder: (context) {
                                        return Container(
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
                                              SizedBox(
                                                height: context.responsive.sm,
                                              ),
                                              Text(
                                                S.of(context).imageNotAvailable,
                                                style: TextStyle(
                                                  color: Colors.grey[700],
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                              )
                            : (image != null
                                  ? Image.file(
                                      image,
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: double.infinity,
                                      alignment: Alignment.center,
                                    )
                                  : Container(color: Colors.grey[200])),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: context.responsive.lg),
                _deseaseNameAndConfidence(current),
                SizedBox(height: context.responsive.lg),
                _buildAnalysisDetails(current),
                SizedBox(height: context.responsive.lg),
                _buildRecommendations(context, current),
                SizedBox(height: context.responsive.lg),

                // Analyze Another Crop Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
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
                            const Icon(Icons.camera_alt_rounded),
                            SizedBox(width: context.responsive.sm),
                            Text(
                              S.of(context).analyzeAnotherCrop,
                              style: TextStyle(
                                fontSize: context.responsive.textMD,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: context.responsive.md),

                // Back to Home Button
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const TabsScreen(),
                        ),
                        (route) => false,
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
                            const Icon(Icons.home_rounded),
                            SizedBox(width: context.responsive.sm),
                            Text(
                              S.of(context).backToHome,
                              style: TextStyle(
                                fontSize: context.responsive.textMD,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row _recomendatons(BuildContext context, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: context.responsive.rs(6),
          width: context.responsive.rs(6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        SizedBox(width: context.responsive.sm),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              color: const Color.fromARGB(255, 48, 48, 48),
              fontSize: context.responsive.textMD,
            ),
          ),
        ),
      ],
    );
  }

  Container _deseaseNameAndConfidence(DetectionResult? current) {
    // Get disease info to determine if healthy
    DiseaseInfo? diseaseInfo;
    if (current != null) {
      diseaseInfo = DiseaseDatabase.getDiseaseInfoByDisplayName(
        current.diseaseName,
      );
    }

    final isHealthy = diseaseInfo?.isHealthy ?? false;
    final statusColor = isHealthy ? Colors.green : Colors.red;
    final backgroundColor = isHealthy
        ? const Color.fromARGB(193, 133, 255, 143)
        : const Color.fromARGB(193, 255, 221, 218);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.responsive.lg,
        vertical: context.responsive.sm,
      ),
      width: double.infinity,
      height: context.responsive.rs(120),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(context.responsive.lg),
        color: backgroundColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Icon(
                isHealthy ? Icons.check_circle_rounded : Icons.warning_rounded,
                size: context.responsive.rs(60),
                color: statusColor,
              ),
              SizedBox(width: context.responsive.xs),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Builder(
                      builder: (context) {
                        return Text(
                          current?.diseaseName ?? S.of(context).unknown,
                          style: TextStyle(
                            color: statusColor,
                            fontSize: context.responsive.textXL,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                    Builder(
                      builder: (context) {
                        return Text(
                          current?.confidence != null
                              ? '${S.of(context).confidence}: ${((current!.confidence ?? 0) * 100).toStringAsFixed(0)}%'
                              : '${S.of(context).confidence}: N/A',
                          style: TextStyle(
                            color: const Color.fromARGB(255, 95, 95, 95),
                            fontSize: context.responsive.textSM,
                            fontWeight: FontWeight.w500,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          LinearProgressIndicator(
            value: current?.confidence ?? 0.0,
            backgroundColor: Colors.grey,
            color: statusColor,
            borderRadius: BorderRadius.circular(context.responsive.xs),
            minHeight: context.responsive.sm,
          ),
        ],
      ),
    );
  }

  Widget _buildAnalysisDetails(DetectionResult? current) {
    DiseaseInfo? diseaseInfo;
    if (current != null) {
      diseaseInfo = DiseaseDatabase.getDiseaseInfoByDisplayName(
        current.diseaseName,
      );
    }

    return Container(
      padding: EdgeInsets.all(context.responsive.md),
      decoration: BoxDecoration(
        color: const Color.fromARGB(15, 24, 121, 0),
        borderRadius: BorderRadius.circular(context.responsive.lg),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Builder(
            builder: (context) {
              return Text(
                S.of(context).analysisDetails,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: context.responsive.textXL,
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          ),
          SizedBox(height: context.responsive.sm),
          Builder(
            builder: (context) {
              return Text(
                diseaseInfo?.description ??
                    S.of(context).noDescriptionAvailable,
                style: TextStyle(
                  color: const Color.fromARGB(255, 48, 48, 48),
                  fontSize: context.responsive.textMD,
                ),
              );
            },
          ),
          if (diseaseInfo != null && diseaseInfo.symptoms.isNotEmpty) ...[
            SizedBox(height: context.responsive.md),
            Builder(
              builder: (context) {
                return Text(
                  S.of(context).symptoms,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: context.responsive.textLG,
                    fontWeight: FontWeight.w600,
                  ),
                );
              },
            ),
            SizedBox(height: context.responsive.sm),
            ...diseaseInfo.symptoms.map(
              (symptom) => Padding(
                padding: EdgeInsets.only(bottom: context.responsive.xs),
                child: _recomendatons(context, symptom),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildRecommendations(BuildContext context, DetectionResult? current) {
    DiseaseInfo? diseaseInfo;
    if (current != null) {
      diseaseInfo = DiseaseDatabase.getDiseaseInfoByDisplayName(
        current.diseaseName,
      );
    }

    final recommendations = diseaseInfo?.recommendations ?? [];

    return Container(
      padding: EdgeInsets.all(context.responsive.md),
      decoration: BoxDecoration(
        color: const Color.fromARGB(15, 24, 121, 0),
        borderRadius: BorderRadius.circular(context.responsive.lg),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.lightbulb_outline_rounded,
                color: Theme.of(context).colorScheme.primary,
                size: context.responsive.rs(25),
              ),
              SizedBox(width: context.responsive.xs),
              Builder(
                builder: (context) {
                  return Text(
                    S.of(context).recommendations,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: context.responsive.textXL,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            ],
          ),
          SizedBox(height: context.responsive.sm),
          if (recommendations.isEmpty)
            Builder(
              builder: (context) {
                return Text(
                  S.of(context).noRecommendationsAvailable,
                  style: TextStyle(
                    color: const Color.fromARGB(255, 48, 48, 48),
                    fontSize: context.responsive.textMD,
                  ),
                );
              },
            )
          else
            ...recommendations.map(
              (rec) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: _recomendatons(context, rec),
              ),
            ),
        ],
      ),
    );
  }
}
