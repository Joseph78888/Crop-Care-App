import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:crop_care_app/generated/l10n.dart';
import '/data/models/detection_result.dart';
import '/presentation/providers/history_provider.dart';

class TotalHealthyDeasiseFilter extends ConsumerWidget {
  const TotalHealthyDeasiseFilter({super.key, required this.name});
  final String name;
  Color _getDeferenceColor(BuildContext context, String name) {
    return name == S.of(context).total
        ? const Color.fromARGB(255, 65, 87, 255)
        : name == S.of(context).healthy
        ? const Color(0xFF22C55E)
        : name == S.of(context).diseased
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
        border: Border.all(color: _getDeferenceColor(context, name)),
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
                name == 'Total' || name == 'الكل'
                    ? '${total.length}'
                    : name == 'Healthy'|| name == 'سليمه'
                    ? '${total.where((e) => e.status == HealthStatus.healthy).length}'
                    : name == 'Diseased'|| name == 'مريضه'
                    ? '${total.where((e) => e.status == HealthStatus.diseased).length}'
                    : '${total.length}',
                style: TextStyle(color: _getDeferenceColor(context, name), fontSize: 24),
              ),
              const SizedBox(height: 20),

              Text(
                name,
                style: TextStyle(
                  color: _getDeferenceColor(context, name),
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
