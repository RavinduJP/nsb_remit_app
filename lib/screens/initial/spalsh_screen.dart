import 'package:flutter/material.dart';
import 'package:nsb_remit/utils/constants/asset_paths.dart';
import 'package:nsb_remit/widgets/common/alignment_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const backgroundImagePath = AssetPaths.splashScreenBackground;

    precacheImage(const AssetImage(backgroundImagePath), context);

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(backgroundImagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              const SizedBox(
                height: 40.0,
              ),
              ColumnAlignmentWidget(
                alignment: ContentAlignment.end,
                child: SizedBox(
                  width: 200,
                  child: Image.asset('assets/images/nsb_remit_logo.png'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
