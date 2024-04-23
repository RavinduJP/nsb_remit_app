import 'package:flutter/material.dart';
import '../../utils/constants/app_colors.dart';

class InternationalMobileNumberField extends StatefulWidget {
  const InternationalMobileNumberField({
    super.key,
    this.errorText,
    required this.borderColor,
    this.isHighlighted = false,
    this.onChanged,
  });

  final String? errorText;
  final Color borderColor;
  final bool isHighlighted;
  final void Function(String)? onChanged;

  @override
  State<InternationalMobileNumberField> createState() =>
      _InternationalMobileNumberFieldState();
}

class _InternationalMobileNumberFieldState
    extends State<InternationalMobileNumberField> {
  final _countryCodeController = TextEditingController();
  final _mobileNumberControoler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Color borderColor =
        widget.isHighlighted ? Colors.red : const Color(0xffBEBEBE);
    return Row(
      children: [
        //----------------- Country code drop-down field ------------------
        Flexible(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Mobile Number',
                  style: TextStyle(
                      color: Color(0xffF5F5F5),
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: '+94',
                    hintStyle: const TextStyle(
                      color: Color(0xff707070),
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.arrow_drop_down,
                        color: AppColors.textFieldBorderColor,
                        size: 30.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: AppColors.textFieldBorderColor),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: borderColor),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  cursorColor: AppColors.textFieldBorderColor,
                  style: const TextStyle(color: AppColors.heddingColor),
                  onChanged: widget.onChanged,
                  controller: _countryCodeController,
                  // keyboardType: TextInputType.phone,
                ),
              ],
            ),
          ),
        ),
        //----------------- Mobile Number text form field ------------------
        Flexible(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '',
                style: TextStyle(
                    color: Color(0xffF5F5F5),
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Mobile Number',
                    hintStyle: const TextStyle(
                      color: Color(0xff707070),
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: AppColors.textFieldBorderColor),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: borderColor),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  cursorColor: AppColors.textFieldBorderColor,
                  style: const TextStyle(color: AppColors.heddingColor),
                  controller: _mobileNumberControoler,
                  enabled: true,
                  keyboardType: TextInputType.phone,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
