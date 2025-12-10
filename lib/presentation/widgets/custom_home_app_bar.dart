import 'package:crop_care_app/core/utils/responsive_helper.dart';
import 'package:crop_care_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: context.responsive.rs(100),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(context.responsive.rs(20)),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.primary.withOpacity(0.8),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, context.responsive.rs(4)),
          ),
        ],
      ),

      child: Padding(
        padding: EdgeInsets.all(context.responsive.rs(20)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Builder(
                  builder: (context) {
                    return Text(
                      S.of(context).welcomeMessage,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: context.responsive.sp(20),
                      ),
                    );
                  },
                ),

                Builder(
                  builder: (context) {
                    return Text(
                      S.of(context).welcomeSubtitle,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: context.responsive.sp(15),
                      ),
                    );
                  },
                ),
              ],
            ),

            Spacer(),

            Container(
              width: context.responsive.rs(50),
              height: context.responsive.rs(50),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(context.responsive.rs(100)),
                color: Colors.white24,
              ),
              child: const Icon(Icons.eco, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
