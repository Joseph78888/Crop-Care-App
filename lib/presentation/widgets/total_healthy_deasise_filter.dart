import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/data/models/detection_result.dart';
import '/presentation/providers/history_provider.dart';

class TotalHealthyDeasiseFilter extends ConsumerWidget {
  const TotalHealthyDeasiseFilter({super.key, required this.name});
  final String name;
  Color _getDeferenceColor(String name) {
    return name == 'Total'
        ? const Color.fromARGB(255, 65, 87, 255)
        : name == 'Healthy'
        ? const Color(0xFF22C55E)
        : name == 'Diseased'
        ? const Color.fromARGB(255, 255, 83, 83)
        : Colors.black;
  }



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final total = ref.watch(historyProvider);
    
    return Container(
      height: 120,
      width: 120,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.transparent,
        border: Border.all(color: _getDeferenceColor(name)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Text(
                name == 'Total'
                    ? '${total.length}'
                    : name == 'Healthy'
                    ? '${total.where((e) => e.status == HealthStatus.healthy).length}'
                    : name == 'Diseased'
                    ? '${total.where((e) => e.status == HealthStatus.diseased).length}'
                    : '${total.length}',
                style: TextStyle(color: _getDeferenceColor(name), fontSize: 24),
              ),
              const SizedBox(height: 20),

              Text(
                name,
                style: TextStyle(
                  color: _getDeferenceColor(name),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ],
      ),
    );
  }
}
