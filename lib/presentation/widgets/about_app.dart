import 'package:flutter/material.dart';

import '/core/theme/app_colors.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({super.key});

  @override
  Widget build(BuildContext context) {
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
          const Text(
            'Crop Care',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),

          const SizedBox(height: 8),
          const Text(
            'Verstion 1.0.0',
            style: TextStyle(
              fontSize: 16,
              color: Color.fromARGB(195, 53, 53, 53),
            ),
          ),

          const SizedBox(height: 8),
          const Text(
            'AI-Power Plant Disease Detection',
            style: TextStyle(
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
          const Text(
            'Helping farmers identify crop disease with advanced AI technology. '
            'Built with care for the agrecultural community.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Color.fromARGB(195, 53, 53, 53),
            ),
          ),

          const SizedBox(height: 50),
          ListTile(
            onTap: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('coming soon.')));
            },
            leading: const Icon(Icons.groups_outlined),
            title: const Text('Development Team'),
            subtitle: const Text('Meet the creators'),
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
            text: const TextSpan(
              style: TextStyle(
                fontSize: 12,
                color: Color.fromARGB(195, 53, 53, 53),
              ),
              children: [
                TextSpan(text: '2025 Crop Care. Made with '),
                WidgetSpan(
                  child: Icon(Icons.favorite, size: 16, color: Colors.red),
                ),
                TextSpan(text: ' for farmers worldwide.'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
