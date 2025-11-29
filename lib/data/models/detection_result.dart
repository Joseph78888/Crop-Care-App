import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const _uuid = Uuid();

enum HealthStatus { healthy, diseased }

final formatter = DateFormat.yMd(); // date formatter

class DetectionResult {
  final String id;
  final String imagePath; // file path or asset id
  final String diseaseName;
  final DateTime timestamp;
  final HealthStatus  status;
  final double? confidence;

  DetectionResult({
    String? id,
    required this.imagePath,
    required this.diseaseName,
    DateTime? timestamp,
    required this.status,
    this.confidence,
  }) : id = id ?? _uuid.v4(),
       timestamp = timestamp ?? DateTime.now();

  /// Returns the formatted date string for display
  String get formattedDate => formatter.format(timestamp);

  DetectionResult copyWith({
    String? id,
    String? imagePath,
    String? diseaseName,
    DateTime? timestamp,
    HealthStatus? status,
    double? confidence,
  }) {
    return DetectionResult(
      id: id ?? this.id,
      imagePath: imagePath ?? this.imagePath,
      diseaseName: diseaseName ?? this.diseaseName,
      timestamp: timestamp ?? this.timestamp,
      status: status ?? this.status,
      confidence: confidence ?? this.confidence,
    );
  }

  factory DetectionResult.fromJson(Map<String, dynamic> json) {
    return DetectionResult(
      id: json['id'] as String?,
      imagePath: json['imagePath'] as String,
      diseaseName: json['diseaseName'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      status: (json['status'] as String) == 'healthy'
          ? HealthStatus.healthy
          : HealthStatus.diseased,
      confidence: json['confidence'] != null
          ? (json['confidence'] as num).toDouble()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imagePath': imagePath,
      'diseaseName': diseaseName,
      'timestamp': timestamp.toIso8601String(),
      'status': status == HealthStatus.healthy ? 'healthy' : 'diseased',
      'confidence': confidence,
    };
  }
}
