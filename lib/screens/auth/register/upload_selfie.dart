import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/user_details_provider.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/dimensions.dart';
import '../../../utils/constants/routes.dart';
import '../../../widgets/common/button_row.dart';
import '../../../widgets/common/camera_view.dart';
import '../../../widgets/common/common_layout.dart';

class UploadSelfie extends StatelessWidget {
  UploadSelfie({super.key});
  final uploadSelfieImageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      hedingTitle: 'Upload a selfie Image',
      hedingSubTitle:
          'Place your Visa Page in the middle of the \n bellow box. It’ll automatically get scanned.',
      body: Column(
        children: [
          SizedBox(
            height: Dimension.screenHeight * 0.5,
            child: CameraView(
              dottedBorderColor: AppColors.bottomSubHeddingColor,
              capturedImageController: uploadSelfieImageController,
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
              .addSelfieImage(selfieImage: uploadSelfieImageController.text);
          final selfieImage =
              Provider.of<UserDetailsProvider>(context, listen: false)
                  .userDetails
                  .selfieImage;
          print(selfieImage);
          Navigator.of(context).pushNamed(Routes.securityVerificationScreen);
        },
        isEnableGreyBtn: false,
      ),
    );
  }
}
