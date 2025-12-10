import 'package:crop_care_app/core/utils/responsive_helper.dart';
import 'package:crop_care_app/presentation/providers/history_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:crop_care_app/generated/l10n.dart';

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
      padding: EdgeInsets.all(context.responsive.sp(16)),
      height: context.responsive.sp(150),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(context.responsive.sp(20)),
        color: const Color.fromARGB(15, 24, 121, 0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Builder(
            builder: (context) {
              return Text(
                S.of(context).quichStatus,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: context.responsive.sp(20),
                ),
              );
            },
          ),
          SizedBox(height: context.responsive.sp(20)),
          Builder(
            builder: (context) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  statusSection('${total.length}', S.of(context).cropAnalayzed),
                  statusSection('95%', S.of(context).accuracyRate),
                  const SizedBox(),
                ],
              );
            },
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
            fontSize: context.responsive.sp(24),
          ),
        ),
        SizedBox(height: context.responsive.sp(8)),
        Text(
          descreption,
          style: TextStyle(
            color: const Color.fromARGB(255, 102, 102, 102),
            fontSize: context.responsive.sp(14), // Adjust font size dynamically
          ),
        ),
      ],
    );
  }
}
