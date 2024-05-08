import 'package:flutter/material.dart';
import 'package:nsb_remit/providers/user_details_provider.dart';
import 'package:nsb_remit/utils/constants/routes.dart';
import 'package:nsb_remit/widgets/common/button_row.dart';
import 'package:nsb_remit/widgets/common/camera_view.dart';
import 'package:nsb_remit/widgets/common/common_layout.dart';
import 'package:provider/provider.dart';

import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/dimensions.dart';

class ScanPassport extends StatelessWidget {
  ScanPassport({super.key});

  final scanPassportImageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      isGrayButtonAvelable: true,
      hedingTitle: 'Scan your Passport',
      hedingSubTitle:
          'Place your Passport in the middle of the \n bellow box. It’ll automatically get scanned.',
      body: Column(
        children: [
          SizedBox(
            height: Dimension.screenHeight*0.5,
            child: CameraView(
              dottedBorderColor: AppColors.bottomSubHeddingColor,
              capturedImageController: scanPassportImageController,
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
        ],
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
