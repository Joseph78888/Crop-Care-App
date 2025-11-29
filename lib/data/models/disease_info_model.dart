/// Model class for disease information including description and recommendations
class DiseaseInfo {
  final String name;
  final String displayName;
  final String description;
  final List<String> symptoms;
  final List<String> recommendations;
  final bool isHealthy;

  const DiseaseInfo({
    required this.name,
    required this.displayName,
    required this.description,
    required this.symptoms,
    required this.recommendations,
    this.isHealthy = false,
  });

  factory DiseaseInfo.fromJson(Map<String, dynamic> json) {
    return DiseaseInfo(
      name: json['name'] as String,
      displayName: json['displayName'] as String,
      description: json['description'] as String,
      symptoms: (json['symptoms'] as List<dynamic>).cast<String>(),
      recommendations: (json['recommendations'] as List<dynamic>).cast<String>(),
      isHealthy: json['isHealthy'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'displayName': displayName,
      'description': description,
      'symptoms': symptoms,
      'recommendations': recommendations,
      'isHealthy': isHealthy,
    };
  }

  DiseaseInfo copyWith({
    String? name,
    String? displayName,
    String? description,
    List<String>? symptoms,
    List<String>? recommendations,
    bool? isHealthy,
  }) {
    return DiseaseInfo(
      name: name ?? this.name,
      displayName: displayName ?? this.displayName,
      description: description ?? this.description,
      symptoms: symptoms ?? this.symptoms,
      recommendations: recommendations ?? this.recommendations,
      isHealthy: isHealthy ?? this.isHealthy,
    );
  }
}
