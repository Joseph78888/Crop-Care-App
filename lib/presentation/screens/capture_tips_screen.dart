import 'package:flutter/material.dart';

import '/presentation/widgets/capture_image.dart';
import '/presentation/widgets/gradient_scaffold.dart';
import '/presentation/widgets/uploade_image.dart';

class CaptureTipsScreen extends StatelessWidget {
  const CaptureTipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // elevation: 0,
        title: Text(
          'Analyze Your Crop',
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),

            child: Column(
              children: [
                const SizedBox(height: 220),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 32),
                  padding: EdgeInsets.all(22),
                  height: 230,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(193, 237, 245, 235),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.info_outline_rounded,
                        size: 48,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(height: 12),

                      Text(
                        'Capture Tips',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 18),

                      tips('Take a clear photo of the affected leaf'),
                      tips('Ensure good lighting conditions'),
                      tips('Fill the frame with the leaf'),
                      tips('Avoid blurry or dark images'),
                    ],
                  ),
                ),
                const SizedBox(height: 28),

                // capture photo section ===================
                const CaptureContainer(),
                const SizedBox(height: 14),

                // uploade photo section ===================
                const UploadeContainer(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget tips(String info) {
    return Row(
      children: [
        Container(
          height: 4,
          width: 4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.black,
          ),
        ),
        const SizedBox(width: 6),
        Text(info, style: TextStyle(color: Colors.black, fontSize: 14)),
      ],
    );
  }
}
