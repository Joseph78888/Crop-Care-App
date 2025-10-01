class DbLocalDataSource {
  final List<String> _history = <String>[];

  Future<void> saveHistoryItem(String item) async {
    _history.add(item);
  }

  Future<List<String>> fetchHistory() async {
    return List<String>.unmodifiable(_history);
  }
}


