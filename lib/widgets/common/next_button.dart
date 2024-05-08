import 'package:flutter/cupertino.dart';
import 'package:nsb_remit/utils/constants/app_colors.dart';

import '../../utils/constants/dimensions.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key, required this.onTap});

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: Dimension.height8, horizontal: Dimension.width20),
        // margin: const EdgeInsets.symmetric(horizontal: 70.0, vertical: 5.0),
        decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.secondary,
              width: 1.0,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(9.0),
            color: AppColors.secondary,
            shape: BoxShape.rectangle),
        child: Center(
          child: Text(
            'Next',
            style: TextStyle(
              color: AppColors.primary,
              fontSize: Dimension.textSize_14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
