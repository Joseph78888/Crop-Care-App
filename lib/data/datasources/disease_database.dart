import '../models/disease_info_model.dart';

/// Static database containing detailed information for all tomato diseases
class DiseaseDatabase {
  static const Map<String, DiseaseInfo> _diseases = {
    'Tomato___Bacterial_spot': DiseaseInfo(
      name: 'Tomato___Bacterial_spot',
      displayName: 'Bacterial Spot',
      description: 'Bacterial spot is caused by several species of Xanthomonas bacteria. It affects leaves, stems, and fruit, causing dark spots and lesions.',
      symptoms: [
        'Small dark brown spots on leaves',
        'Yellow halos around spots',
        'Leaf drop in severe cases',
        'Fruit lesions with raised centers',
      ],
      recommendations: [
        'Remove and destroy infected plant parts',
        'Apply copper-based bactericides',
        'Avoid overhead watering',
        'Ensure good air circulation',
        'Use disease-resistant varieties',
      ],
    ),
    'Tomato___Early_blight': DiseaseInfo(
      name: 'Tomato___Early_blight',
      displayName: 'Early Blight',
      description: 'Early blight is a fungal disease caused by Alternaria solani. It typically affects older leaves first and can reduce yield significantly.',
      symptoms: [
        'Dark brown spots with concentric rings (target-like)',
        'Yellow tissue around spots',
        'Affects lower, older leaves first',
        'Premature leaf drop',
      ],
      recommendations: [
        'Remove affected leaves immediately',
        'Apply fungicide spray regularly',
        'Improve air circulation around plants',
        'Avoid overhead watering',
        'Mulch to prevent soil splash',
        'Rotate crops annually',
      ],
    ),
    'Tomato___Late_blight': DiseaseInfo(
      name: 'Tomato___Late_blight',
      displayName: 'Late Blight',
      description: 'Late blight is a devastating disease caused by Phytophthora infestans. It can destroy entire crops in days under favorable conditions.',
      symptoms: [
        'Large brown blotches on leaves',
        'White fuzzy growth on leaf undersides',
        'Rapid plant collapse',
        'Brown lesions on stems and fruit',
      ],
      recommendations: [
        'Remove and destroy all infected plants immediately',
        'Apply preventive fungicides before symptoms appear',
        'Ensure excellent air circulation',
        'Avoid watering late in the day',
        'Use resistant varieties',
        'Monitor weather conditions closely',
      ],
    ),
    'Tomato___Leaf_Mold': DiseaseInfo(
      name: 'Tomato___Leaf_Mold',
      displayName: 'Leaf Mold',
      description: 'Leaf mold is caused by the fungus Passalora fulva. It thrives in humid conditions and primarily affects greenhouse tomatoes.',
      symptoms: [
        'Pale green or yellow spots on upper leaf surface',
        'Olive-green to brown fuzzy growth on leaf undersides',
        'Leaves curl and wither',
        'Reduced fruit production',
      ],
      recommendations: [
        'Increase ventilation to reduce humidity',
        'Space plants adequately',
        'Remove infected leaves',
        'Apply appropriate fungicides',
        'Avoid overhead irrigation',
        'Use resistant varieties',
      ],
    ),
    'Tomato___Septoria_leaf_spot': DiseaseInfo(
      name: 'Tomato___Septoria_leaf_spot',
      displayName: 'Septoria Leaf Spot',
      description: 'Septoria leaf spot is caused by the fungus Septoria lycopersici. It typically appears after fruit set and affects lower leaves first.',
      symptoms: [
        'Small circular spots with dark borders',
        'Gray or tan centers with tiny black dots',
        'Starts on lower leaves and moves upward',
        'Severe defoliation possible',
      ],
      recommendations: [
        'Remove and destroy infected leaves',
        'Apply fungicide treatments',
        'Mulch around plants',
        'Avoid overhead watering',
        'Stake plants for better air flow',
        'Practice crop rotation',
      ],
    ),
    'Tomato___Spider_mites Two-spotted_spider_mite': DiseaseInfo(
      name: 'Tomato___Spider_mites Two-spotted_spider_mite',
      displayName: 'Two-Spotted Spider Mite',
      description: 'Spider mites are tiny arachnids that feed on plant sap. They thrive in hot, dry conditions and can cause significant damage.',
      symptoms: [
        'Tiny yellow or white spots on leaves',
        'Fine webbing on leaves and stems',
        'Leaves turn bronze or yellow',
        'Leaf drop in severe infestations',
      ],
      recommendations: [
        'Spray plants with strong water jet',
        'Apply insecticidal soap or neem oil',
        'Introduce beneficial predatory mites',
        'Maintain adequate moisture levels',
        'Remove heavily infested plants',
        'Avoid excessive nitrogen fertilization',
      ],
    ),
    'Tomato___Target_Spot': DiseaseInfo(
      name: 'Tomato___Target_Spot',
      displayName: 'Target Spot',
      description: 'Target spot is caused by the fungus Corynespora cassiicola. It affects leaves, stems, and fruit, especially in warm, humid conditions.',
      symptoms: [
        'Brown spots with concentric rings',
        'Spots may have yellow halos',
        'Affects all plant parts',
        'Rapid defoliation in severe cases',
      ],
      recommendations: [
        'Remove infected plant debris',
        'Apply appropriate fungicides',
        'Improve air circulation',
        'Avoid overhead irrigation',
        'Use disease-free seeds',
        'Practice crop rotation',
      ],
    ),
    'Tomato___Tomato_Yellow_Leaf_Curl_Virus': DiseaseInfo(
      name: 'Tomato___Tomato_Yellow_Leaf_Curl_Virus',
      displayName: 'Yellow Leaf Curl Virus',
      description: 'Tomato Yellow Leaf Curl Virus (TYLCV) is transmitted by whiteflies. It causes severe stunting and yield loss.',
      symptoms: [
        'Upward curling of leaf margins',
        'Yellowing between leaf veins',
        'Severe plant stunting',
        'Reduced fruit production',
        'Small, distorted leaves',
      ],
      recommendations: [
        'Control whitefly populations immediately',
        'Remove and destroy infected plants',
        'Use reflective mulches to repel whiteflies',
        'Apply insecticides for whitefly control',
        'Use virus-resistant varieties',
        'Install insect screening in greenhouses',
      ],
    ),
    'Tomato___Tomato_mosaic_virus': DiseaseInfo(
      name: 'Tomato___Tomato_mosaic_virus',
      displayName: 'Tomato Mosaic Virus',
      description: 'Tomato Mosaic Virus (ToMV) is highly contagious and spreads through contact. It causes mottling and distortion of leaves.',
      symptoms: [
        'Mottled light and dark green pattern on leaves',
        'Leaf distortion and curling',
        'Stunted plant growth',
        'Reduced fruit quality and yield',
        'Fruit may show brown streaks',
      ],
      recommendations: [
        'Remove and destroy infected plants immediately',
        'Disinfect tools and hands regularly',
        'Avoid smoking near plants (tobacco can carry virus)',
        'Use virus-free seeds and transplants',
        'Control aphids and other potential vectors',
        'Plant resistant varieties',
      ],
    ),
    'Tomato___healthy': DiseaseInfo(
      name: 'Tomato___healthy',
      displayName: 'Healthy',
      description: 'Your tomato plant appears healthy with no signs of disease or pest damage. Continue with regular care and monitoring.',
      symptoms: [
        'Vibrant green leaves',
        'No spots or discoloration',
        'Strong, upright growth',
        'Normal fruit development',
      ],
      recommendations: [
        'Continue regular watering schedule',
        'Maintain balanced fertilization',
        'Monitor plants regularly for early disease detection',
        'Ensure good air circulation',
        'Practice preventive care',
        'Keep garden area clean and weed-free',
      ],
      isHealthy: true,
    ),
  };

  /// Get disease information by name
  static DiseaseInfo? getDiseaseInfo(String diseaseName) {
    return _diseases[diseaseName];
  }

  /// Get disease information by display name (case-insensitive)
  static DiseaseInfo? getDiseaseInfoByDisplayName(String displayName) {
    final normalizedName = displayName.toLowerCase().trim();
    return _diseases.values.firstWhere(
      (disease) => disease.displayName.toLowerCase() == normalizedName,
      orElse: () => _diseases.values.first,
    );
  }

  /// Get all disease names
  static List<String> getAllDiseaseNames() {
    return _diseases.keys.toList();
  }

  /// Get all diseases
  static List<DiseaseInfo> getAllDiseases() {
    return _diseases.values.toList();
  }

  /// Check if a disease name exists
  static bool containsDisease(String diseaseName) {
    return _diseases.containsKey(diseaseName);
  }
}
