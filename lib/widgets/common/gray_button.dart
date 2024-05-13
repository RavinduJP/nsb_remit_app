import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constants/app_colors.dart';
import 'common_button.dart';

class GrayButton extends StatelessWidget {
  const GrayButton({super.key, this.grayButtonText, this.onTap});
  final String? grayButtonText;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: CommonButton(
        bordercolor: AppColors.secondary,
        borderWidth: 1.0,
        color: AppColors.grayButtonColor,
        boxShape: BoxShape.rectangle,
        buttonText: grayButtonText!,
        btnTextColor: AppColors.whiteColor,
        btnFontSize: 14.r,
        btnFontWeight: FontWeight.w600,
        onTap: onTap!,
      ),
    );
  }
}
