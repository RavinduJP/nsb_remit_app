import 'package:flutter/material.dart';
import 'package:nsb_remit/utils/constants/app_colors.dart';

class CustomTextFromField extends StatelessWidget {
  const CustomTextFromField({
    super.key,
    this.isHighlighted = false,
    required this.controller,
    this.lableText,
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
          style: const TextStyle(
              color: Color(0xffF5F5F5),
              fontSize: 12.0,
              fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          height: 5.0,
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
                color: Color(0xff707070),
                fontSize: 12.0,
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
                    child: const Icon(
                      Icons.arrow_drop_down,
                      color: AppColors.textFieldBorderColor,
                      size: 30.0,
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
      ],
    );
  }
}
