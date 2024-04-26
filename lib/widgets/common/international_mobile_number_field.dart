import 'package:flutter/material.dart';
import '../../utils/constants/app_colors.dart';

class InternationalMobileNumberField extends StatefulWidget {
   InternationalMobileNumberField({
    super.key,
    this.errorText,
    required this.borderColor,
    this.isHighlighted = false,
    this.onChanged,
    required this.list,
    required this.selectedCountryCode,
    required this.mobileNumberControler,
  });

  final String? errorText;
  final Color borderColor;
  final bool isHighlighted;
  final void Function(String)? onChanged;
  final List<String> list;
  String selectedCountryCode;
  final TextEditingController mobileNumberControler;

  @override
  State<InternationalMobileNumberField> createState() =>
      _InternationalMobileNumberFieldState();
}

class _InternationalMobileNumberFieldState
    extends State<InternationalMobileNumberField> {
 

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
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.textFieldBorderColor,
                      width: 1.0,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 13.0, vertical: 6.0),
                  child: DropdownButton(
                    value: widget.selectedCountryCode,
                    elevation: 16,
                    style:
                        const TextStyle(color: AppColors.bottomSubHeddingColor),
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: AppColors.textFieldBorderColor,
                      size: 25.0,
                    ),
                    underline: Container(
                      height: 0,
                      color: AppColors.bottomSubHeddingColor,
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        widget.selectedCountryCode = value!;
                      });
                    },
                    items: widget.list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Container(
                          child: Text(
                            value,
                            style: const TextStyle(
                                color: AppColors.subHeddingColor,
                                fontSize: 14.0),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
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
                  controller: widget.mobileNumberControler,
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
