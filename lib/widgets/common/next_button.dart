import 'package:flutter/cupertino.dart';
import 'package:nsb_remit/utils/constants/app_colors.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key, required this.onTap});

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
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
        child: const Center(
          child: Text(
            'Next',
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
