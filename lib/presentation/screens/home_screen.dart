import 'package:flutter/material.dart';

import 'package:crop_care_app/generated/l10n.dart';
import '/presentation/widgets/quick_status_section.dart';
import '/presentation/widgets/custom_capture_container.dart';
import '/presentation/widgets/custom_home_app_bar.dart';
import '/core/utils/responsive_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.responsive.md),
      child: Column(
        children: [
          const CustomHomeAppBar(),
          SizedBox(height: context.responsive.md),

          Builder(
            builder: (context) {
              return Text(
                S.of(context).howWeCanHelp,
                style: TextStyle(
                  color: const Color.fromARGB(255, 65, 65, 65),
                  fontWeight: FontWeight.w500,
                  fontSize: context.responsive.textLG,
                ),
              );
            }
          ),
          SizedBox(height: context.responsive.md),

          Builder(
            builder: (context) {
              return CustomCaptureContainer.capture(
                title: S.of(context).captureImage,
                subTitle: S.of(context).captureSubtitle,
                icon: Icons.camera_alt,
                color1: Theme.of(context).colorScheme.primary.withValues(alpha: .8),
                color2: Theme.of(context).colorScheme.primary,
              );
            }
          ),
          const SizedBox(height: 14),

          Builder(
            builder: (context) {
              return CustomCaptureContainer.upload(
                title: S.of( context).uploadeImage,
                subTitle: S.of(context).uploadeImageSubtitle,
                icon: Icons.upload_rounded,
                color1: Theme.of(
                  context,
                ).colorScheme.secondary.withValues(alpha: .8),
                color2: Theme.of(context).colorScheme.secondary,
              );
            }
          ),
          const SizedBox(height: 22),

          QuickStatsSection(),
        ],
      ),
    );
  }
}
