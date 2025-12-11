import 'package:crop_care_app/core/utils/responsive_helper.dart';
import 'package:flutter/material.dart';

import '/presentation/screens/capture_tips_screen.dart';

class CustomCaptureContainer extends StatelessWidget {
  const CustomCaptureContainer.upload({
    super.key,
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.color1,
    required this.color2,
  });
  const CustomCaptureContainer.capture({
    super.key,
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.color1,
    required this.color2,
  });
  final String title;
  final String subTitle;
  final IconData icon;
  final Color color1;
  final Color color2;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => CaptureTipsScreen()));
      },
      child: Container(
        width: double.infinity,
        height: context.responsive.rs(90),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(context.responsive.rs(20)),
          gradient: LinearGradient(colors: [color1, color2]),
        ),
        child: Padding(
          padding: EdgeInsets.all(context.responsive.rs(20)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: context.responsive.rs(55),
                height: context.responsive.rs(55),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    context.responsive.rs(100),
                  ),
                  color: Colors.white24,
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: context.responsive.rs(30),
                ),
              ),

              SizedBox(width: context.responsive.rs(12)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: context.responsive.sp(16),
                    ),
                  ),
                  Text(
                    subTitle,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.85),
                      fontSize: context.responsive.sp(14),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
