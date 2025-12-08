import 'package:flutter/material.dart';

import 'package:crop_care_app/generated/l10n.dart';
import '/core/theme/app_colors.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          width: double.infinity,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(193, 237, 245, 235),
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: AppColors.primary,

                  borderRadius: BorderRadius.circular(200),
                ),

                child: const Icon(
                  Icons.eco,
                  size: 80,
                  color: Color.fromARGB(171, 46, 46, 46),
                ),
              ),

              const SizedBox(height: 20),
              Text(
                S.of(context).cropCare,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),

              const SizedBox(height: 8),
              Text(
                S.of(context).version,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(195, 53, 53, 53),
                ),
              ),

              const SizedBox(height: 8),
              Text(
                S.of(context).aiPoweredPlantDisease,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(195, 53, 53, 53),
                ),
              ),

              const SizedBox(height: 8),
              const Divider(
                thickness: 1,
                color: Colors.black26,
                indent: 16,
                endIndent: 16,
              ),

              const SizedBox(height: 8),
              Text(
                S.of(context).aboutDescription,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(195, 53, 53, 53),
                ),
              ),

              const SizedBox(height: 50),
              ListTile(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(S.of(context).comingSoon)),
                  );
                },
                leading: const Icon(Icons.groups_outlined),
                title: Text(S.of(context).developmentTeam),
                subtitle: Text(S.of(context).meetTheCreators),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),

              const SizedBox(height: 8),
              const Divider(
                thickness: 1,
                color: Colors.black26,
                indent: 16,
                endIndent: 16,
              ),

              const SizedBox(height: 8),
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color.fromARGB(195, 53, 53, 53),
                  ),
                  children: [
                    TextSpan(text: '${S.of(context).madeWithLove} '),
                    const WidgetSpan(
                      child: Icon(Icons.favorite, size: 16, color: Colors.red),
                    ),
                    TextSpan(text: ' ${S.of(context).forFarmers}'),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
