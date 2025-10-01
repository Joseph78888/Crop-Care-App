import 'package:flutter/material.dart';

class HistoryList extends StatelessWidget {
  final List<String> items;

  const HistoryList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const Center(child: Text('No history yet'));
    }
    return ListView.separated(
      itemCount: items.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (_, int index) => ListTile(
        title: Text(items[index]),
      ),
    );
  }
}


