import 'package:flutter/material.dart';

class CaptureScreen extends StatelessWidget {
  static const String routeName = '/capture';

  const CaptureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Capture')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, '/analysis'),
          child: const Text('Go to AI Analysis'),
        ),
      ),
    );
  }
}


