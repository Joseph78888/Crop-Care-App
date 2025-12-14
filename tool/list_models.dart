// ignore_for_file: avoid_print
import 'dart:convert';
import 'dart:io';

void main() async {
  // Simple .env parser for the tool script
  final envFile = File('.env');
  String apiKey = '';
  if (envFile.existsSync()) {
    final lines = await envFile.readAsLines();
    for (var line in lines) {
      if (line.startsWith('GEMINI_API_KEY=')) {
        apiKey = line.split('=')[1].trim();
      }
    }
  }

  // final apiKey = 'YOUR_API_KEY'; // Or set manually if .env fails
  if (apiKey.isEmpty) {
    print('No API key set. Please ensure .env exists with GEMINI_API_KEY');
    exit(1);
  }

  try {
    final client = HttpClient();
    final request = await client.getUrl(
      Uri.parse(
        'https://generativelanguage.googleapis.com/v1beta/models?key=$apiKey',
      ),
    );
    final response = await request.close();

    final responseBody = await response
        .transform(SystemEncoding().decoder)
        .join();

    if (response.statusCode != 200) {
      print('Error: ${response.statusCode} - $responseBody');
      return;
    }

    final json = jsonDecode(responseBody);
    final models = json['models'] as List;

    print("Available models for generateContent:");
    for (final model in models) {
      final methods = List<String>.from(
        model['supportedGenerationMethods'] ?? [],
      );
      if (methods.contains('generateContent')) {
        print(model['name']);
      }
    }
  } catch (e) {
    print('Error: $e');
  }
}
