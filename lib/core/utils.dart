import 'dart:developer' as developer;

void logInfo(String message) {
  developer.log(message, name: 'CropCare');
}

void logError(String message, {Object? error, StackTrace? stackTrace}) {
  developer.log(message, name: 'CropCare', error: error, stackTrace: stackTrace, level: 1000);
}


