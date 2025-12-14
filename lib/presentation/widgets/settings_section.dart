import 'package:crop_care_app/core/utils/responsive_helper.dart';
import 'package:flutter/material.dart';

import '/core/theme/app_colors.dart';

class SettingsSections extends StatefulWidget {
  const SettingsSections({
    super.key,
    required this.title,
    required this.tiles,
    required this.icon,
  });
  final String title;
  final IconData icon;
  final List<Widget> tiles;

  List<Widget> _buildTilsWithDividers() {
    final List<Widget> items = [];
    for (int i = 0; i < tiles.length; i++) {
      items.add(tiles[i]);
      if (i < tiles.length - 1) {
        items.add(
          const Divider(
            thickness: 1,
            color: Colors.black26,
            indent: 16,
            endIndent: 16,
          ),
        );
      }
    }
    return items;
  }

  @override
  State<SettingsSections> createState() => _SettingsSectionState();
}

class _SettingsSectionState extends State<SettingsSections> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sectionTitle(),

        SizedBox(height: context.responsive.rs(16)),
        Container(
          // section container
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(context.responsive.rs(20)),
            color: const Color.fromARGB(193, 237, 245, 235),
          ),
          child: Column(children: [...widget._buildTilsWithDividers()]),
        ),
      ],
    );
  }

  Row sectionTitle() {
    return Row(
      children: [
        Icon(
          color: AppColors.primary,
          widget.icon,
          size: context.responsive.sp(22),
        ),

        SizedBox(width: context.responsive.rs(8)),
        Text(
          widget.title, // section title
          style: TextStyle(
            color: const Color.fromARGB(191, 65, 65, 65), // section title color
            fontWeight: FontWeight.bold,
            fontSize: context.responsive.sp(18),
          ),
        ),
      ],
    );
  }
}
