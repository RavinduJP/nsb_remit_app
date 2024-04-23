import 'package:flutter/material.dart';
import 'package:nsb_remit/widgets/common/button_row.dart';
import 'package:nsb_remit/widgets/common/camera_view.dart';
import 'package:nsb_remit/widgets/common/common_layout.dart';

class ScanVisa extends StatelessWidget {
  const ScanVisa({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      hedingTitle: 'Scan your Visa Page',
      hedingSubTitle:
          'Place your Visa Page in the middle of the \n bellow box. It’ll automatically get scanned.',
      body: const CameraView(),
      bottomButton: ButtonRow(
        isEnableGreyBtn: true,
        onTap: () {},
        grayButtonText: 'Skip',
        onTapGreyButton: () {},
      ),
    );
  }
}
