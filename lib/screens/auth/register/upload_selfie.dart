import 'package:flutter/material.dart';

import '../../../utils/constants/routes.dart';
import '../../../widgets/common/button_row.dart';
import '../../../widgets/common/camera_view.dart';
import '../../../widgets/common/common_layout.dart';

class UploadSelfie extends StatelessWidget {
  const UploadSelfie({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      hedingTitle: 'Upload a selfie Image',
      hedingSubTitle:
          'Place your Visa Page in the middle of the \n bellow box. It’ll automatically get scanned.',
      body: const CameraView(),
      bottomButton: ButtonRow(
        onTap: () {
          Navigator.of(context).pushNamed(Routes.securityVerificationScreen);
        },
        isEnableGreyBtn: false,
      ),
    );
  }
}