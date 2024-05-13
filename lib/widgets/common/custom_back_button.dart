import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nsb_remit/utils/constants/app_colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key, 
    // required this.onTap,
  });

  // final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w),
        // margin: const EdgeInsets.symmetric(horizontal: 70.0, vertical: 5.0),
        decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.backButtonBorderColor,
              width: 1.0,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(9.0),
            color: Colors.transparent,
            shape: BoxShape.rectangle),
        child: Center(
          child: Text(
            'Back',
            style: TextStyle(
              color: AppColors.heddingColor,
              fontSize: 14.r,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
