import 'package:flutter/material.dart';
import 'package:nsb_remit/utils/constants/app_colors.dart';
import 'package:nsb_remit/utils/constants/dimensions.dart';

class CustomTextFromField extends StatelessWidget {
  const CustomTextFromField({
    super.key,
    this.isHighlighted = false,
    required this.controller,
    this.lableText = '',
    required this.hintText,
    this.errorText,
    this.enabled = true,
    this.onChanged,
    this.keyboardType,
    this.isEnableSuffixIcon = false,
    this.onTap,
  });

  final TextEditingController controller;
  final String? lableText;
  final String hintText;
  final String? errorText;
  final bool isHighlighted;
  final bool enabled;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final bool? isEnableSuffixIcon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    Color borderColor = isHighlighted ? Colors.red : const Color(0xffBEBEBE);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          lableText!,
          style: TextStyle(
              color: AppColors.heddingColor,
              fontSize: Dimension.textSize_12,
              fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: Dimension.height3,
        ),
        SizedBox(
          height: Dimension.screenHeight*0.09,
          child: TextFormField(
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                  color: AppColors.bottomSubHeddingColor,
                  fontSize: Dimension.textSize_12,
                  fontWeight: FontWeight.w400),
              errorText: errorText,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor),
                borderRadius: BorderRadius.circular(10.0),
              ),
              suffixIcon: isEnableSuffixIcon!
                  ? GestureDetector(
                      onTap: onTap ?? () {},
                      child: Icon(
                        Icons.arrow_drop_down,
                        color: AppColors.textFieldBorderColor,
                        size: Dimension.height30,
                      ),
                    )
                  : null,
            ),
            cursorColor: AppColors.textFieldBorderColor,
            style: const TextStyle(color: AppColors.heddingColor),
            controller: controller,
            enabled: enabled,
            onChanged: onChanged,
            keyboardType: keyboardType,
          ),
        ),
        SizedBox(
          height: Dimension.height10,
        ),
      ],
    );
  }
}
