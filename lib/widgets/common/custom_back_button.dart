import 'package:flutter/material.dart';
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
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
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
        child: const Center(
          child: Text(
            'Back',
            style: TextStyle(
              color: AppColors.heddingColor,
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
