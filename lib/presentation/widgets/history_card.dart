import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:crop_care_app/generated/l10n.dart';
import '../../data/models/detection_result.dart';
import '../../presentation/providers/history_provider.dart';
import '../../data/datasources/disease_database.dart';
import '../../data/models/disease_info_model.dart';
import '../../presentation/screens/result_screen.dart';
import '../../core/utils/responsive_helper.dart';

class HistoryCard extends ConsumerWidget {
  final DetectionResult result;
  const HistoryCard({super.key, required this.result});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statusColor = result.status == HealthStatus.healthy
        ? Colors.green
        : Colors.red;
    return Card(
      color: const Color.fromARGB(49, 206, 206, 206),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(context.responsive.rs(12)),
      ),
      child: InkWell(
        onTap: () {
          // STEP 1: Data Identification
          // We already have the DetectionResult object (this.result) with a unique ID.
          // Instead of extracting just the ID, we pass the entire object via the provider.

          // STEP 2: Navigation Parameter Passing
          // Update the currentResultProvider with this historical result.
          // The ResultScreen watches this provider to display the data.
          ref.read(currentResultProvider.notifier).state = result;

          // Navigate to the ResultScreen
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => const ResultScreen()));
        },
        child: ListTile(
          contentPadding: EdgeInsets.all(context.responsive.rs(12)),
          leading: Hero(
            tag: 'history-image-${result.id}',
            child: ClipRRect(
              borderRadius: BorderRadius.circular(context.responsive.rs(8)),
              child: SizedBox(
                width: context.responsive.rs(72),
                height: context.responsive.rs(80),
                child: _buildImage(),
              ),
            ),
          ),
          title: Builder(
            builder: (context) {
              final diseaseInfo =
                  DiseaseDatabase.getDiseaseInfo(result.diseaseName) ??
                  DiseaseDatabase.getDiseaseInfoByDisplayName(
                    result.diseaseName,
                  );
              final displayName =
                  diseaseInfo?.getLocalizedName(context) ?? result.diseaseName;

              return Text(
                displayName,
                style: TextStyle(
                  fontSize: context.responsive.sp(16),
                  fontWeight: FontWeight.w600,
                ),
              );
            },
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: context.responsive.rs(6)),
              Text(
                '${result.timestamp.day}/${result.timestamp.month}/${result.timestamp.year} at ${result.timestamp.hour.toString().padLeft(2, '0')}:${result.timestamp.minute.toString().padLeft(2, '0')}',
                style: TextStyle(
                  fontSize: context.responsive.sp(12),
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: context.responsive.rs(6)),
              Row(
                children: [
                  Container(
                    // height: 25,
                    padding: EdgeInsets.symmetric(
                      horizontal: context.responsive.rs(8),
                      vertical: context.responsive.rs(4),
                    ),
                    decoration: BoxDecoration(
                      color: statusColor.shade50,
                      border: Border.all(color: statusColor),
                      borderRadius: BorderRadius.circular(
                        context.responsive.rs(20),
                      ),
                    ),
                    child: Builder(
                      builder: (context) {
                        final statusText = result.status == HealthStatus.healthy
                            ? S.of(context).healthy
                            : S.of(context).diseased;
                        return Text(
                          statusText,
                          style: TextStyle(
                            color: statusColor,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: context.responsive.rs(8)),
                  Text(
                    '${(result.confidence! * 100).toStringAsFixed(0)}%',
                    style: TextStyle(
                      fontSize: context.responsive.sp(14),
                      color: Colors.grey[600],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          trailing: Icon(Icons.arrow_forward_ios_rounded),
        ),
      ),
    );
  }

  Widget _buildImage() {
    // If imagePath points to a file on device, show it; otherwise fall back to asset/error placeholder
    try {
      final file = File(result.imagePath);
      if (file.existsSync()) {
        return Image.file(
          file,
          fit: BoxFit.cover,
          errorBuilder: (c, e, s) => _placeholder(),
        );
      }
    } catch (_) {}
    // fallback to asset or placeholder
    return Image.asset(
      result.imagePath,
      fit: BoxFit.cover,
      errorBuilder: (c, e, s) => _placeholder(),
    );
  }

  Widget _placeholder() {
    return Container(
      color: Colors.grey[200],
      child: Center(child: Icon(Icons.broken_image, color: Colors.grey[600])),
    );
  }
}
