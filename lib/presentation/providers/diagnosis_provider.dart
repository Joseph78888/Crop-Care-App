import 'package:flutter/foundation.dart';

class DiagnosisProvider extends ChangeNotifier {
  bool _isLoading = false;
  String? _result;

  bool get isLoading => _isLoading;
  String? get result => _result;

  Future<void> analyzeDummy() async {
    _isLoading = true;
    _result = null;
    notifyListeners();

    await Future<void>.delayed(const Duration(seconds: 1));
    _result = 'Healthy';
    _isLoading = false;
    notifyListeners();
  }
}


