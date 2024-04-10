import 'package:flutter/material.dart';

class CommonLayout extends StatelessWidget {
  const CommonLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              child: SizedBox(),
            )
          ],
        ),
      ),
    );
  }
}
