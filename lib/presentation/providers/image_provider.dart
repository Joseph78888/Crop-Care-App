import 'dart:io';
import 'package:flutter_riverpod/legacy.dart';

/// Provider to hold the currently selected/captured image
final selectedImageProvider = StateProvider<File?>((ref) => null);
