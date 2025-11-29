import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/presentation/widgets/capture_image.dart';
import '/presentation/screens/tabs_screen.dart';
import '/presentation/widgets/gradient_scaffold.dart';
import '/presentation/providers/history_provider.dart';
import '/data/models/detection_result.dart';

class ResultScreen extends ConsumerStatefulWidget {
  const ResultScreen({super.key});

  @override
  ConsumerState<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends ConsumerState<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    final DetectionResult? current = ref.watch(currentResultProvider);

    return GradientScaffold(
      appBar: AppBar(
        title: Text('Analyze Result'),
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Card(
                  // shape: BeveledRectangleBorder(borderRadius: BorderRadiusGeometry.circular(20)),
                  child: Container(
                    height: 300,
                    width: double.infinity,
                    padding: const EdgeInsets.all(8),
                    child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Hero(
                            tag: 'preview-image',
                            child: current != null
                                ? Image.file(
                                    File(current.imagePath),
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: double.infinity,
                                    alignment: Alignment.center,
                                    errorBuilder: (context, error, stackTrace) => Container(
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
                                          const SizedBox(height: 8),
                                          Text(
                                            'Image not available',
                                            style: TextStyle(color: Colors.grey[700]),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : (image != null
                                    ? Image.file(
                                        image!,
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
                const SizedBox(height: 20),
                _deseaseNameAndConfidence(current),
                const SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(15, 24, 121, 0),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Analysis Details',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),

                      Text(
                        'Early blight is a fungal disease that causes dark spots on leaves.',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 48, 48, 48),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(15, 24, 121, 0),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.lightbulb_outline_rounded,
                            color: Theme.of(context).colorScheme.primary,
                            size: 25,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'Recommendations',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),

                      _recomendatons(
                        context,
                        'Remove affected leaves immediatly',
                      ),
                      const SizedBox(height: 10),
                      _recomendatons(context, 'Apply fungicide spray'),
                      const SizedBox(height: 10),
                      _recomendatons(
                        context,
                        'Immprove air circulation around plants',
                      ),
                      const SizedBox(height: 10),
                      _recomendatons(context, 'Avoide overhead watering'),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

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
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.camera_alt_rounded),
                        SizedBox(width: 8),
                        Text(
                          'Analyze Another Crop',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Back to Home Button
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(
                        context,
                      ).push(MaterialPageRoute(builder: (ctx) => TabsScreen()));
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.home_rounded),
                        SizedBox(width: 8),
                        Text('Back to Home', style: TextStyle(fontSize: 16)),
                      ],
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
          height: 6,
          width: 6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              color: const Color.fromARGB(255, 48, 48, 48),
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }

  Container _deseaseNameAndConfidence(DetectionResult? current) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromARGB(193, 255, 221, 218),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Icon(Icons.warning_rounded, size: 60, color: Colors.red),
              const SizedBox(width: 6),

              Column(
                children: [
                  Text(
                    current?.diseaseName ?? 'Unknown',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    current?.confidence != null
                        ? 'Confidence: ${((current!.confidence ?? 0) * 100).toStringAsFixed(0)}%'
                        : 'Confidence: N/A',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 95, 95, 95),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
          // const SizedBox(height: 8),
          LinearProgressIndicator(
            value: .87,
            backgroundColor: Colors.grey,
            color: Colors.red,
            borderRadius: BorderRadius.circular(6),
            minHeight: 8,
          ),
        ],
      ),
    );
  }
}
