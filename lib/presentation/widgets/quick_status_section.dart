import 'package:crop_care_app/presentation/providers/history_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuickStatsSection extends ConsumerStatefulWidget {
  const QuickStatsSection({super.key});

  @override
  ConsumerState<QuickStatsSection> createState() => _QuickStatsSectionState();
}

class _QuickStatsSectionState extends ConsumerState<QuickStatsSection> {
  @override
  Widget build(BuildContext context) {
    final total = ref.watch(historyProvider);
    return Container(
      padding: EdgeInsets.all(16),
      height: 140,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromARGB(15, 24, 121, 0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Quick Status',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              statusSection('${total.length}', 'Crop Analyzed'),
              statusSection('95%', 'Accuracy Rate'),
              const SizedBox(),
            ],
          ),
        ],
      ),
    );
  }

  Column statusSection(String mainStatus, String descreption) {
    return Column(
      children: [
        Text(
          mainStatus,
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        SizedBox(height: 8),
        Text(
          descreption,
          style: TextStyle(
            color: const Color.fromARGB(255, 102, 102, 102),
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
