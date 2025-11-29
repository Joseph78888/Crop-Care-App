import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/detection_result.dart';
import '../providers/history_provider.dart';

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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        child: ListTile(
          contentPadding: const EdgeInsets.all(12),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(width: 72, height: 80, child: _buildImage()),
          ),
          title: Text(
            result.diseaseName,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 6),
              Text(
                '${result.timestamp.day}/${result.timestamp.month}/${result.timestamp.year} at ${result.timestamp.hour.toString().padLeft(2, '0')}:${result.timestamp.minute.toString().padLeft(2, '0')}',
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Container(
                    // height: 25,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: statusColor.shade50,
                      border: Border.all(color: statusColor),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      result.status.name,
                      style: TextStyle(
                        color: statusColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '${(result.confidence! * 100).toStringAsFixed(0)}%',
                    style: TextStyle(
                      fontSize: 14,
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
