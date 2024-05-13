import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nsb_remit/utils/constants/routes.dart';
import 'package:nsb_remit/widgets/common/button_row.dart';
import 'package:nsb_remit/widgets/common/camera_view.dart';
import 'package:nsb_remit/widgets/common/common_layout.dart';
import 'package:provider/provider.dart';

import '../../../providers/user_details_provider.dart';
import '../../../utils/constants/app_colors.dart';

class ScanVisa extends StatelessWidget {
  ScanVisa({super.key});
  final scanVisaImageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      isGrayButtonAvelable: true,
      hedingTitle: 'Scan your Visa Page',
      hedingSubTitle:
          'Place your Visa Page in the middle of the \n bellow box. It’ll automatically get scanned.',
      body: Column(
        children: [
          SizedBox(
            height: 340.h,
            child: CameraView(
              dottedBorderColor: AppColors.bottomSubHeddingColor,
              capturedImageController: scanVisaImageController,
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
        ],
      ),
      bottomButton: ButtonRow(
        onTap: () {
          Provider.of<UserDetailsProvider>(context, listen: false)
              .addScaanVisaImage(visaImage: scanVisaImageController.text);
          final visaImage =
              Provider.of<UserDetailsProvider>(context, listen: false)
                  .userDetails
                  .visaImage;
          print(visaImage);
          Navigator.of(context).pushNamed(Routes.uploadSelfieScreen);
        },
        isEnableGreyBtn: true,
        grayButtonText: 'Skip',
        onTapGreyButton: () {
          Navigator.of(context).pushNamed(Routes.uploadSelfieScreen);
        },
      ),
    );
  }
}
