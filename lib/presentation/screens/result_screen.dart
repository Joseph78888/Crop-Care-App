import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  static const String routeName = '/result';

  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text('Result')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Diagnosis result will appear here.'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/recommendations'),
              child: const Text('See Recommendations'),
            ),
          ],
        ),
      ),
    );
  }
}


