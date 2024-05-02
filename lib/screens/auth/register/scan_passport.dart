import 'package:flutter/material.dart';
import 'package:nsb_remit/providers/user_details_provider.dart';
import 'package:nsb_remit/utils/constants/routes.dart';
import 'package:nsb_remit/widgets/common/button_row.dart';
import 'package:nsb_remit/widgets/common/camera_view.dart';
import 'package:nsb_remit/widgets/common/common_layout.dart';
import 'package:provider/provider.dart';

import '../../../utils/constants/app_colors.dart';

class ScanPassport extends StatelessWidget {
  ScanPassport({super.key});

  final scanPassportImageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      hedingTitle: 'Scan your Passport',
      hedingSubTitle:
          'Place your Passport in the middle of the \n bellow box. It’ll automatically get scanned.',
      body: CameraView(
        dottedBorderColor: AppColors.bottomSubHeddingColor,
        capturedImageController: scanPassportImageController,
      ),
      bottomButton: ButtonRow(
        isEnableGreyBtn: true,
        onTap: () {
          Provider.of<UserDetailsProvider>(context, listen: false)
              .addScaanPassportImage(
                  passportImage: scanPassportImageController.text);
          final passportImage =
              Provider.of<UserDetailsProvider>(context, listen: false)
                  .userDetails
                  .passportImage;
          print(passportImage);
          Navigator.of(context).pushNamed(Routes.scanVisaScreen);
        },
        grayButtonText: 'Don’t Have Passport',
        onTapGreyButton: () {
          Navigator.of(context).pushNamed(Routes.proofDocumentsScreen);
        },
      ),
    );
  }
}
