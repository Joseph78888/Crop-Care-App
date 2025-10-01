import 'package:flutter/material.dart';

class RecommendationsScreen extends StatelessWidget {
  static const String routeName = '/recommendations';

  const RecommendationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recommendations')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, '/history'),
          child: const Text('Go to History'),
        ),
      ),
    );
  }
}



