import 'package:flutter/material.dart';
import 'package:nsb_remit/utils/constants/routes.dart';
import 'package:nsb_remit/widgets/common/button_row.dart';
import 'package:nsb_remit/widgets/common/camera_view.dart';
import 'package:nsb_remit/widgets/common/common_layout.dart';

class ScanPassport extends StatelessWidget {
  const ScanPassport({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      hedingTitle: 'Scan your Passport',
      hedingSubTitle:
          'Place your Passport in the middle of the \n bellow box. It’ll automatically get scanned.',
      body: const CameraView(),
      bottomButton: ButtonRow(
        isEnableGreyBtn: true,
        onTap: () {
          Navigator.of(context).pushNamed(Routes.scanVisaScreen);
        },
        onTapGreyButton: () {},
      ),
    );
  }
}
