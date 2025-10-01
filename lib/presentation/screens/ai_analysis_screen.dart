import 'package:flutter/material.dart';

class AIAnalysisScreen extends StatelessWidget {
  static const String routeName = '/analysis';

  const AIAnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AI Analysis')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, '/result'),
          child: const Text('Show Result'),
        ),
      ),
    );
  }
}



