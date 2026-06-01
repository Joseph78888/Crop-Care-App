import 'package:flutter/widgets.dart';
import 'package:crop_care_app/generated/l10n.dart';

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

extension LocalizedDiseaseInfo on DiseaseInfo {
  String getLocalizedName(BuildContext context) {
    final s = S.of(context);
    switch (name) {
      case 'Tomato___Bacterial_spot': return s.disease_Bacterial_spot_name;
      case 'Tomato___Early_blight': return s.disease_Early_blight_name;
      case 'Tomato___Late_blight': return s.disease_Late_blight_name;
      case 'Tomato___Leaf_Mold': return s.disease_Leaf_Mold_name;
      case 'Tomato___Septoria_leaf_spot': return s.disease_Septoria_leaf_spot_name;
      case 'Tomato___Target_Spot': return s.disease_Target_Spot_name;
      case 'Tomato___Spider_mites Two-spotted_spider_mite': return s.disease_Spider_mites_name;
      case 'Tomato___Tomato_Yellow_Leaf_Curl_Virus': return s.disease_Yellow_Leaf_Curl_Virus_name;
      case 'Tomato___Tomato_mosaic_virus': return s.disease_Tomato_mosaic_virus_name;
      case 'Tomato___healthy': return s.disease_healthy_name;
      case 'Unknown': return s.disease_Unknown_name;
      default: return displayName;
    }
  }

  String getLocalizedDescription(BuildContext context) {
    final s = S.of(context);
    switch (name) {
      case 'Tomato___Bacterial_spot': return s.disease_Bacterial_spot_description;
      case 'Tomato___Early_blight': return s.disease_Early_blight_description;
      case 'Tomato___Late_blight': return s.disease_Late_blight_description;
      case 'Tomato___Leaf_Mold': return s.disease_Leaf_Mold_description;
      case 'Tomato___Septoria_leaf_spot': return s.disease_Septoria_leaf_spot_description;
      case 'Tomato___Target_Spot': return s.disease_Target_Spot_description;
      case 'Tomato___Spider_mites Two-spotted_spider_mite': return s.disease_Spider_mites_description;
      case 'Tomato___Tomato_Yellow_Leaf_Curl_Virus': return s.disease_Yellow_Leaf_Curl_Virus_description;
      case 'Tomato___Tomato_mosaic_virus': return s.disease_Tomato_mosaic_virus_description;
      case 'Tomato___healthy': return s.disease_healthy_description;
      case 'Unknown': return s.disease_Unknown_description;
      default: return description;
    }
  }

  List<String> getLocalizedSymptoms(BuildContext context) {
    final s = S.of(context);
    String symptomsStr = '';
    switch (name) {
      case 'Tomato___Bacterial_spot': symptomsStr = s.disease_Bacterial_spot_symptoms; break;
      case 'Tomato___Early_blight': symptomsStr = s.disease_Early_blight_symptoms; break;
      case 'Tomato___Late_blight': symptomsStr = s.disease_Late_blight_symptoms; break;
      case 'Tomato___Leaf_Mold': symptomsStr = s.disease_Leaf_Mold_symptoms; break;
      case 'Tomato___Septoria_leaf_spot': symptomsStr = s.disease_Septoria_leaf_spot_symptoms; break;
      case 'Tomato___Target_Spot': symptomsStr = s.disease_Target_Spot_symptoms; break;
      case 'Tomato___Spider_mites Two-spotted_spider_mite': symptomsStr = s.disease_Spider_mites_symptoms; break;
      case 'Tomato___Tomato_Yellow_Leaf_Curl_Virus': symptomsStr = s.disease_Yellow_Leaf_Curl_Virus_symptoms; break;
      case 'Tomato___Tomato_mosaic_virus': symptomsStr = s.disease_Tomato_mosaic_virus_symptoms; break;
      case 'Tomato___healthy': symptomsStr = s.disease_healthy_symptoms; break;
      case 'Unknown': symptomsStr = s.disease_Unknown_symptoms; break;
      default: return symptoms;
    }
    return symptomsStr.split('\n').where((e) => e.trim().isNotEmpty).toList();
  }

  List<String> getLocalizedRecommendations(BuildContext context) {
    final s = S.of(context);
    String recStr = '';
    switch (name) {
      case 'Tomato___Bacterial_spot': recStr = s.disease_Bacterial_spot_recommendations; break;
      case 'Tomato___Early_blight': recStr = s.disease_Early_blight_recommendations; break;
      case 'Tomato___Late_blight': recStr = s.disease_Late_blight_recommendations; break;
      case 'Tomato___Leaf_Mold': recStr = s.disease_Leaf_Mold_recommendations; break;
      case 'Tomato___Septoria_leaf_spot': recStr = s.disease_Septoria_leaf_spot_recommendations; break;
      case 'Tomato___Target_Spot': recStr = s.disease_Target_Spot_recommendations; break;
      case 'Tomato___Spider_mites Two-spotted_spider_mite': recStr = s.disease_Spider_mites_recommendations; break;
      case 'Tomato___Tomato_Yellow_Leaf_Curl_Virus': recStr = s.disease_Yellow_Leaf_Curl_Virus_recommendations; break;
      case 'Tomato___Tomato_mosaic_virus': recStr = s.disease_Tomato_mosaic_virus_recommendations; break;
      case 'Tomato___healthy': recStr = s.disease_healthy_recommendations; break;
      case 'Unknown': recStr = s.disease_Unknown_recommendations; break;
      default: return recommendations;
    }
    return recStr.split('\n').where((e) => e.trim().isNotEmpty).toList();
  }
}
