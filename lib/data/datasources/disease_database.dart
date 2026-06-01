import '../models/disease_info_model.dart';

/// Static database containing detailed information for all tomato diseases
/// recognised by the MobileNetV2 classifier (10 classes).
class DiseaseDatabase {
  static const Map<String, DiseaseInfo> _diseases = {
    // ── Bacterial ──────────────────────────────────────────────
    'Tomato___Bacterial_spot': DiseaseInfo(
      name: 'Tomato___Bacterial_spot',
      displayName: 'Bacterial Spot',
      description:
          'Bacterial spot is caused by Xanthomonas bacteria. '
          'It affects leaves, stems, and fruit, causing dark spots '
          'and lesions that reduce yield and fruit quality.',
      symptoms: [
        'Small dark brown to black spots on leaves',
        'Yellow halos around spots',
        'Leaf drop in severe cases',
        'Raised, scab-like lesions on fruit',
      ],
      recommendations: [
        'Remove and destroy infected plant parts',
        'Apply copper-based bactericides',
        'Avoid overhead watering',
        'Ensure good air circulation',
        'Use disease-free seeds and transplants',
      ],
    ),

    // ── Fungal ─────────────────────────────────────────────────
    'Tomato___Early_blight': DiseaseInfo(
      name: 'Tomato___Early_blight',
      displayName: 'Early Blight',
      description:
          'Early blight is caused by the fungus Alternaria solani. '
          'It typically affects older, lower leaves first and can '
          'cause significant defoliation and reduced fruit quality.',
      symptoms: [
        'Dark brown spots with concentric rings (target pattern)',
        'Yellowing tissue around spots',
        'Starts on lower leaves and moves upward',
        'Premature leaf drop',
      ],
      recommendations: [
        'Remove affected leaves immediately',
        'Apply fungicide spray regularly',
        'Improve air circulation by spacing plants',
        'Mulch around plants to prevent soil splash',
        'Rotate crops every 2-3 years',
      ],
    ),

    'Tomato___Late_blight': DiseaseInfo(
      name: 'Tomato___Late_blight',
      displayName: 'Late Blight',
      description:
          'Late blight is caused by the oomycete Phytophthora '
          'infestans. It spreads rapidly in cool, wet weather and '
          'can devastate an entire crop within days.',
      symptoms: [
        'Large, irregular water-soaked patches on leaves',
        'White fuzzy growth on the underside of leaves',
        'Dark brown blotches on stems',
        'Rapid plant collapse in humid conditions',
      ],
      recommendations: [
        'Remove and destroy all infected plants immediately',
        'Apply preventive fungicides before wet weather',
        'Do not compost infected material',
        'Avoid overhead irrigation',
        'Plant resistant varieties when possible',
      ],
    ),

    'Tomato___Leaf_Mold': DiseaseInfo(
      name: 'Tomato___Leaf_Mold',
      displayName: 'Leaf Mold',
      description:
          'Leaf mold is caused by the fungus Passalora fulva '
          '(Cladosporium fulvum). It thrives in warm, humid '
          'greenhouse conditions and can reduce photosynthesis.',
      symptoms: [
        'Pale green to yellow spots on upper leaf surfaces',
        'Olive-green to grayish-purple fuzzy growth on undersides',
        'Leaves curl, wither, and drop prematurely',
        'Most common in high-humidity environments',
      ],
      recommendations: [
        'Increase ventilation in greenhouses',
        'Reduce humidity below 85 %',
        'Remove infected leaves promptly',
        'Apply fungicides if the outbreak is severe',
        'Use resistant tomato varieties',
      ],
    ),

    'Tomato___Septoria_leaf_spot': DiseaseInfo(
      name: 'Tomato___Septoria_leaf_spot',
      displayName: 'Septoria Leaf Spot',
      description:
          'Septoria leaf spot is caused by the fungus Septoria '
          'lycopersici. It typically appears after fruit set and '
          'can cause extensive defoliation.',
      symptoms: [
        'Small circular spots with dark brown borders',
        'Gray or tan centers with tiny black dots (pycnidia)',
        'Starts on lower leaves and moves upward',
        'Severe defoliation if untreated',
      ],
      recommendations: [
        'Remove and destroy infected leaves',
        'Apply fungicide treatments regularly',
        'Mulch around plants to prevent soil splash',
        'Avoid overhead watering',
        'Stake or cage plants for better airflow',
      ],
    ),

    'Tomato___Target_Spot': DiseaseInfo(
      name: 'Tomato___Target_Spot',
      displayName: 'Target Spot',
      description:
          'Target spot is caused by the fungus Corynespora '
          'cassiicola. It affects leaves, stems, and fruit, '
          'causing circular lesions with concentric rings.',
      symptoms: [
        'Small brown spots that enlarge into target-like rings',
        'Lesions may merge, causing large necrotic areas',
        'Premature defoliation of lower canopy',
        'Fruit lesions with sunken, dark spots',
      ],
      recommendations: [
        'Remove and destroy infected plant debris',
        'Apply appropriate fungicides preventively',
        'Improve air circulation between plants',
        'Practice crop rotation with non-solanaceous crops',
        'Avoid excessive nitrogen fertilisation',
      ],
    ),

    // ── Pests ──────────────────────────────────────────────────
    'Tomato___Spider_mites Two-spotted_spider_mite': DiseaseInfo(
      name: 'Tomato___Spider_mites Two-spotted_spider_mite',
      displayName: 'Spider Mites (Two-Spotted)',
      description:
          'Two-spotted spider mites (Tetranychus urticae) are tiny '
          'arachnids that feed on plant sap, causing stippling, '
          'yellowing, and reduced vigour. They thrive in hot, dry '
          'conditions.',
      symptoms: [
        'Tiny yellow or white stippling on leaves',
        'Fine silken webbing on leaf undersides',
        'Leaves turn bronze or yellow and become brittle',
        'Severe infestations cause leaf drop and plant stress',
      ],
      recommendations: [
        'Spray plants with a strong jet of water',
        'Apply insecticidal soap or neem oil',
        'Increase ambient humidity around plants',
        'Remove heavily infested leaves and destroy them',
        'Introduce beneficial predatory mites',
      ],
    ),

    // ── Viral ──────────────────────────────────────────────────
    'Tomato___Tomato_Yellow_Leaf_Curl_Virus': DiseaseInfo(
      name: 'Tomato___Tomato_Yellow_Leaf_Curl_Virus',
      displayName: 'Yellow Leaf Curl Virus',
      description:
          'Tomato Yellow Leaf Curl Virus (TYLCV) is transmitted by '
          'whiteflies (Bemisia tabaci). It causes severe stunting, '
          'leaf curling, and dramatic yield loss.',
      symptoms: [
        'Upward curling of leaf margins',
        'Yellowing (chlorosis) between leaf veins',
        'Severely stunted plant growth',
        'Small, distorted, cupped leaves',
      ],
      recommendations: [
        'Control whitefly populations with yellow sticky traps',
        'Apply appropriate insecticides against whiteflies',
        'Remove and destroy infected plants early',
        'Use TYLCV-resistant tomato varieties',
        'Use reflective mulches to deter whiteflies',
      ],
    ),

    'Tomato___Tomato_mosaic_virus': DiseaseInfo(
      name: 'Tomato___Tomato_mosaic_virus',
      displayName: 'Tomato Mosaic Virus',
      description:
          'Tomato Mosaic Virus (ToMV) is a highly stable virus '
          'spread through contaminated tools, hands, and seeds. '
          'It causes mottled leaves and can persist in soil debris '
          'for years.',
      symptoms: [
        'Light and dark green mosaic patterns on leaves',
        'Leaf curling and distortion',
        'Stunted plant growth',
        'Reduced and uneven fruit ripening',
      ],
      recommendations: [
        'Remove and destroy infected plants immediately',
        'Disinfect tools and hands with milk or bleach solution',
        'Use certified virus-free seeds and transplants',
        'Avoid tobacco use near plants (cross-contamination)',
        'Plant ToMV-resistant varieties',
      ],
    ),

    // ── Healthy ────────────────────────────────────────────────
    'Tomato___healthy': DiseaseInfo(
      name: 'Tomato___healthy',
      displayName: 'Healthy Tomato',
      description:
          'Your tomato plant appears healthy with no visible signs '
          'of disease or pest damage. Continue with regular care '
          'and monitoring to maintain plant health.',
      symptoms: [
        'Vibrant green leaves with no spots',
        'Strong, upright stem growth',
        'No discoloration or wilting',
        'Normal fruit development',
      ],
      recommendations: [
        'Continue regular watering schedule',
        'Maintain balanced fertilisation',
        'Monitor plants weekly for early signs of trouble',
        'Ensure good air circulation between plants',
        'Practice crop rotation each season',
      ],
      isHealthy: true,
    ),

    // ── Fallback ───────────────────────────────────────────────
    'Unknown': DiseaseInfo(
      name: 'Unknown',
      displayName: 'Unknown Condition',
      description:
          'The model could not confidently identify a specific '
          'disease. Please ensure the image is clear, well-lit, '
          'and contains a tomato plant leaf.',
      symptoms: [
        'Unclear or blurry image',
        'Image may not contain a tomato leaf',
        'Low-confidence prediction from the model',
      ],
      recommendations: [
        'Take a clearer, well-lit photo',
        'Ensure the leaf fills most of the frame',
        'Avoid shadows and glare on the leaf surface',
        'Consult an agricultural expert if symptoms persist',
      ],
    ),
  };

  /// Get disease information by name.
  static DiseaseInfo? getDiseaseInfo(String diseaseName) {
    return _diseases[diseaseName];
  }

  /// Get disease information by display name (case-insensitive).
  static DiseaseInfo? getDiseaseInfoByDisplayName(String displayName) {
    final normalizedName = displayName.toLowerCase().trim();
    try {
      return _diseases.values.firstWhere(
        (disease) => disease.displayName.toLowerCase() == normalizedName,
      );
    } catch (_) {
      return null;
    }
  }

  /// Get all disease names.
  static List<String> getAllDiseaseNames() {
    return _diseases.keys.toList();
  }

  /// Get all diseases.
  static List<DiseaseInfo> getAllDiseases() {
    return _diseases.values.toList();
  }

  /// Check if a disease name exists.
  static bool containsDisease(String diseaseName) {
    return _diseases.containsKey(diseaseName);
  }
}
