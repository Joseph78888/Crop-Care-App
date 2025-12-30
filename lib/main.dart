import 'package:flutter/material.dart';
import 'package:crop_care_app/app_entry.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  // Run app immediately with splash screen
  runApp(const ProviderScope(child: MyApp()));
}
