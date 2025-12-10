import 'package:crop_care_app/core/utils/responsive_helper.dart';
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
      height: context.responsive.sp(110),
      width: context.responsive.sp(110),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(context.responsive.sp(20)),
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
              SizedBox(height: context.responsive.sp(20)),
              Text(
                name == 'Total' || name == 'الكل'
                    ? '${total.length}'
                    : name == 'Healthy' || name == 'سليمه'
                    ? '${total.where((e) => e.status == HealthStatus.healthy).length}'
                    : name == 'Diseased' || name == 'مريضه'
                    ? '${total.where((e) => e.status == HealthStatus.diseased).length}'
                    : '${total.length}',
                style: TextStyle(
                  color: _getDeferenceColor(context, name),
                  fontSize: context.responsive.sp(24),
                ),
              ),
              SizedBox(height: context.responsive.rs(20)),

              Text(
                name,
                style: TextStyle(
                  color: _getDeferenceColor(context, name),
                  fontSize: context.responsive.sp(14),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: context.responsive.rs(10)),
            ],
          ),
        ],
      ),
    );
  }
}
