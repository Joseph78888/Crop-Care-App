import '../models/disease_info_model.dart';

/// Static database containing detailed information for all tomato diseases
class DiseaseDatabase {
  static const Map<String, DiseaseInfo> _diseases = {
    'Tomato Healthy': DiseaseInfo(
      name: 'Tomato Healthy',
      displayName: 'Healthy Tomato',
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
        'Monitor plants regularly',
        'Ensure good air circulation',
      ],
      isHealthy: true,
    ),
    'Tomato Septoria Leaf Spot': DiseaseInfo(
      name: 'Tomato Septoria Leaf Spot',
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
      ],
    ),
    'Tomato Bacterial Spot': DiseaseInfo(
      name: 'Tomato Bacterial Spot',
      displayName: 'Bacterial Spot',
      description: 'Bacterial spot is caused by Xanthomonas bacteria. It affects leaves, stems, and fruit, causing dark spots and lesions.',
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
      ],
    ),
    'Tomato Blight': DiseaseInfo(
      name: 'Tomato Blight',
      displayName: 'Tomato Blight',
      description: 'Blight is a serious fungal disease that can affect leaves, stems, and fruit. It includes Early Blight and Late Blight.',
      symptoms: [
        'Dark brown spots with concentric rings (Early Blight)',
        'Large brown blotches with white fuzz (Late Blight)',
        'Yellowing tissue around spots',
        'Rapid plant collapse in severe cases',
      ],
      recommendations: [
        'Remove affected leaves immediately',
        'Apply fungicide spray regularly',
        'Improve air circulation',
        'Avoid overhead watering',
        'Rotate crops annually',
      ],
    ),
    'Cabbage Healthy': DiseaseInfo(
      name: 'Cabbage Healthy',
      displayName: 'Healthy Cabbage',
      description: 'Your cabbage plant is healthy and developing well.',
      symptoms: [
        'Firm, green heads',
        'No discoloration or holes',
        'Vigorous growth',
      ],
      recommendations: [
        'Maintain consistent moisture',
        'Monitor for pests like cabbage worms',
        'Fertilize appropriately',
      ],
      isHealthy: true,
    ),
    'Tomato Spider Mite': DiseaseInfo(
      name: 'Tomato Spider Mite',
      displayName: 'Spider Mites',
      description: 'Spider mites are tiny arachnids that feed on plant sap, causing stippling and yellowing.',
      symptoms: [
        'Tiny yellow or white spots (stippling)',
        'Fine webbing on leaves',
        'Leaves turn bronze or yellow',
        'Leaf drop',
      ],
      recommendations: [
        'Spray with strong water jet',
        'Apply insecticidal soap or neem oil',
        'Increase humidity',
        'Remove heavily infested leaves',
      ],
    ),
    'Tomato Leaf Mold': DiseaseInfo(
      name: 'Tomato Leaf Mold',
      displayName: 'Leaf Mold',
      description: 'Leaf mold is a fungal disease that thrives in humid conditions, causing yellow spots on upper leaf surfaces.',
      symptoms: [
        'Pale green/yellow spots on upper leaves',
        'Olive-green fuzzy growth on undersides',
        'Leaves curl and wither',
      ],
      recommendations: [
        'Increase ventilation',
        'Reduce humidity',
        'Remove infected leaves',
        'Apply fungicides if needed',
      ],
    ),
    'Tomato_Yellow Leaf Curl Virus': DiseaseInfo(
      name: 'Tomato_Yellow Leaf Curl Virus',
      displayName: 'Yellow Leaf Curl Virus',
      description: 'TYLCV is a viral disease transmitted by whiteflies, causing severe stunting and leaf curling.',
      symptoms: [
        'Upward curling of leaf margins',
        'Yellowing between veins',
        'Stunted growth',
        'Small, distorted leaves',
      ],
      recommendations: [
        'Control whiteflies',
        'Remove infected plants',
        'Use resistant varieties',
        'Use reflective mulches',
      ],
    ),
    'Soy_Frogeye_Leaf_Spot': DiseaseInfo(
      name: 'Soy_Frogeye_Leaf_Spot',
      displayName: 'Frogeye Leaf Spot',
      description: 'Frogeye leaf spot is a fungal disease of soybeans caused by Cercospora sojina.',
      symptoms: [
        'Circular to angular spots on leaves',
        'Reddish-brown borders with gray centers',
        'Minute dark spots in the center',
      ],
      recommendations: [
        'Use resistant varieties',
        'Rotate crops',
        'Apply fungicides if severe',
        'Manage crop residue',
      ],
    ),
    'Soy_Downy_Mildew': DiseaseInfo(
      name: 'Soy_Downy_Mildew',
      displayName: 'Downy Mildew',
      description: 'Downy mildew is a common fungal disease affecting soybeans, especially in cool, wet conditions.',
      symptoms: [
        'Pale green to light yellow spots on upper leaves',
        'Grayish tufts of fungal growth on undersides',
        'Leaves may turn yellow and drop',
      ],
      recommendations: [
        'Plant resistant varieties',
        'Rotate with non-host crops',
        'Ensure good drainage',
        'Fungicides are rarely needed',
      ],
    ),
    'Maize_Ravi_Corn_Rust': DiseaseInfo(
      name: 'Maize_Ravi_Corn_Rust',
      displayName: 'Corn Rust',
      description: 'Corn rust is a fungal disease causing pustules on leaves, which can reduce photosynthesis and yield.',
      symptoms: [
        'Small, circular to elongate brown pustules',
        'Pustules appear on both leaf surfaces',
        'Leaves may turn yellow and die',
      ],
      recommendations: [
        'Plant resistant hybrids',
        'Apply fungicides early if needed',
        'Monitor fields regularly',
      ],
    ),
    'Maize_Healthy': DiseaseInfo(
      name: 'Maize_Healthy',
      displayName: 'Healthy Maize',
      description: 'Your maize (corn) plant is healthy and growing vigorously.',
      symptoms: [
        'Dark green leaves',
        'Strong stalks',
        'No lesions or discoloration',
      ],
      recommendations: [
        'Maintain adequate nitrogen',
        'Water regularly during pollination',
        'Control weeds',
      ],
      isHealthy: true,
    ),
    'Maize_Grey_Leaf_Spot': DiseaseInfo(
      name: 'Maize_Grey_Leaf_Spot',
      displayName: 'Grey Leaf Spot',
      description: 'Grey leaf spot is a significant fungal disease of corn, causing rectangular lesions.',
      symptoms: [
        'Rectangular, gray to tan lesions',
        'Lesions run parallel to leaf veins',
        'Entire leaves may blight and die',
      ],
      recommendations: [
        'Use resistant hybrids',
        'Practice crop rotation',
        'Manage crop residue',
        'Apply fungicides if economic threshold reached',
      ],
    ),
    'Maize_Lethal_Necrosis': DiseaseInfo(
      name: 'Maize_Lethal_Necrosis',
      displayName: 'Lethal Necrosis',
      description: 'Maize Lethal Necrosis (MLN) is a serious viral disease caused by co-infection of two viruses.',
      symptoms: [
        'Chlorotic mottling of leaves',
        'Necrosis (death) of leaf margins',
        'Stunted growth',
        'Dead heart symptoms',
      ],
      recommendations: [
        'Use certified disease-free seeds',
        'Control vector insects (thrips, beetles)',
        'Remove infected plants',
        'Practice strict crop rotation',
      ],
    ),
    'Soy_Healthy': DiseaseInfo(         
      name: 'Soy_Healthy',
      displayName: 'Healthy Soybean',
      description: 'Your soybean plant is healthy.',
      symptoms: [
        'Green, trifoliate leaves',
        'No spots or yellowing',
        'Normal growth habit',
      ],
      recommendations: [
        'Monitor for pests',
        'Ensure adequate soil moisture',
        'Keep field weed-free',
      ],
      isHealthy: true,
    ),
    'Unknown': DiseaseInfo(
      name: 'Unknown',
      displayName: 'Unknown Condition',
      description: 'The model could not confidently identify a specific disease (Confidence < 75%). Please ensure the image is clear, well-lit, and contains a plant leaf.',
      symptoms: [
        'Unclear image',
        'Not a plant leaf',
        'Low confidence prediction',
      ],
      recommendations: [
        'Take a clearer photo',
        'Ensure the leaf is centered',
        'Avoid shadows and glare',
        'Consult an expert if symptoms persist',
      ],
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
