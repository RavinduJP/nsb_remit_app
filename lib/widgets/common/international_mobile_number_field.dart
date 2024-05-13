import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/constants/app_colors.dart';

class InternationalMobileNumberField extends StatefulWidget {
  const InternationalMobileNumberField({
    super.key,
    this.errorText,
    required this.borderColor,
    this.isHighlighted = false,
    this.onChanged,
    required this.list,
    required this.selectedCountryCode,
    required this.mobileNumberControler,
    this.countryCodeControler,
  });

  final String? errorText;
  final Color borderColor;
  final bool isHighlighted;
  final void Function(String)? onChanged;
  final List<String> list;
  final String selectedCountryCode;
  final TextEditingController mobileNumberControler;
  final TextEditingController? countryCodeControler;

  @override
  State<InternationalMobileNumberField> createState() =>
      _InternationalMobileNumberFieldState();
}

class _InternationalMobileNumberFieldState
    extends State<InternationalMobileNumberField> {
  String selectedCountry = "";
  @override
  Widget build(BuildContext context) {
    Color borderColor =
        widget.isHighlighted ? Colors.red : const Color(0xffBEBEBE);
    return Column(
      children: [
        Row(
          children: [
            //----------------- Country code drop-down field ------------------
            Flexible(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mobile Number',
                      style: TextStyle(
                          color: AppColors.heddingColor,
                          fontSize: 12.r,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Container(
                      height: 50.h,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.textFieldBorderColor,
                          width: 1.0,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 13.w, vertical: 6.h),
                      child: DropdownButton(
                        value: widget.selectedCountryCode,
                        elevation: 16,
                        style: const TextStyle(
                            color: AppColors.bottomSubHeddingColor),
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: AppColors.heddingColor,
                          size: 25.sp,
                        ),
                        underline: Container(
                          height: 0,
                          color: AppColors.bottomSubHeddingColor,
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            widget.countryCodeControler!.text = value!;
                       selectedCountry = value;
                          });
                        },
                        items: widget.list
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Container(
                              child: Text(
                                value,
                                style: TextStyle(
                                    color: AppColors.subHeddingColor,
                                    fontSize: 14.r),
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
                  Text(
                    ' ',
                    style: TextStyle(
                        color: AppColors.heddingColor,
                        fontSize: 12.r,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: SizedBox(
                      height: 50.h,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Mobile Number',
                          hintStyle: TextStyle(
                            color: AppColors.bottomSubHeddingColor,
                            fontSize: 12.r,
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
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
      ],
    );
  }
}
