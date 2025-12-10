import 'package:crop_care_app/core/utils/responsive_helper.dart';
import 'package:flutter/material.dart';

import 'package:crop_care_app/generated/l10n.dart';
import 'package:path/path.dart';
import '/presentation/widgets/capture_image.dart';
import '/presentation/widgets/gradient_scaffold.dart';
import '/presentation/widgets/uploade_image.dart';

class CaptureTipsScreen extends StatelessWidget {
  const CaptureTipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // elevation: 0,
        title: Builder(
          builder: (context) {
            return Text(S.of(context).analyzeYourCrop);
          },
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(context.responsive.sp(16)),

            child: Column(
              children: [
                SizedBox(height: context.responsive.sp(220)),
                Builder(
                  builder: (context) {
                    return Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: context.responsive.sp(32),
                      ),
                      padding: EdgeInsets.all(context.responsive.sp(16)),
                      height: context.responsive.sp(210),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(193, 237, 245, 235),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.info_outline_rounded,
                            size: context.responsive.sp(48),
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          SizedBox(height: context.responsive.sp(12)),

                          Text(
                            S.of(context).captureTips,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: context.responsive.sp(18)),

                          tips(S.of(context).captureTip1, context),
                          tips(S.of(context).captureTip2, context),
                          tips(S.of(context).captureTip3, context),
                          tips(S.of(context).captureTip4, context),
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(height: context.responsive.sp(28)),

                // capture photo section ===================
                CaptureContainer(),
                SizedBox(height: context.responsive.sp(14)),

                // uploade photo section ===================
                UploadeContainer(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget tips(String info, BuildContext context) {
    return Row(
      children: [
        Container(
          height: context.responsive.sp(4),
          width: context.responsive.sp(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.black,
          ),
        ),
        SizedBox(width: context.responsive.sp(6)),
        Text(
          info,
          style: TextStyle(
            color: Colors.black,
            fontSize: context.responsive.sp(12),
          ),
        ),
      ],
    );
  }
}
