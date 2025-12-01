import 'package:flutter/material.dart';

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

          Text(
            'How can we help your crops today?',
            style: TextStyle(
              color: const Color.fromARGB(255, 65, 65, 65),
              fontWeight: FontWeight.w500,
              fontSize: context.responsive.textLG,
            ),
          ),
          SizedBox(height: context.responsive.md),

          CustomCaptureContainer.capture(
            title: 'Capture Image',
            subTitle: 'Take a photo of your crop leaf',
            icon: Icons.camera_alt,
            color1: Theme.of(context).colorScheme.primary.withValues(alpha: .8),
            color2: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 14),

          CustomCaptureContainer.upload(
            title: 'Uploade Image',
            subTitle: 'Select from your gallery',
            icon: Icons.upload_rounded,
            color1: Theme.of(
              context,
            ).colorScheme.secondary.withValues(alpha: .8),
            color2: Theme.of(context).colorScheme.secondary,
          ),
          const SizedBox(height: 22),

          QuickStatsSection(),
        ],
      ),
    );
  }
}
