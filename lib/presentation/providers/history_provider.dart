import 'package:flutter/foundation.dart';

class HistoryProvider extends ChangeNotifier {
  final List<String> _items = <String>[];

  List<String> get items => List<String>.unmodifiable(_items);

  void add(String item) {
    _items.add(item);
    notifyListeners();
  }
}


