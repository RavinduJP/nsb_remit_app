import 'package:flutter/material.dart';
import '../../utils/constants/app_colors.dart';
import '../../utils/constants/dimensions.dart';

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
    this.countryCodeControler,
  });

  final String? errorText;
  final Color borderColor;
  final bool isHighlighted;
  final void Function(String)? onChanged;
  final List<String> list;
  String selectedCountryCode;
  final TextEditingController mobileNumberControler;
  final TextEditingController? countryCodeControler;

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
    return Column(
      children: [
        Row(
          children: [
            //----------------- Country code drop-down field ------------------
            Flexible(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(right: Dimension.width10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   Text(
                      'Mobile Number',
                      style: TextStyle(
                          color: AppColors.heddingColor,
                          fontSize: Dimension.textSize_12,
                          fontWeight: FontWeight.w400),
                    ),
                     SizedBox(
                      height: Dimension.height3,
                    ),
                    Container(
                      height: Dimension.screenHeight * 0.09,
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
                          color: AppColors.heddingColor,
                          size: 25.0,
                        ),
                        underline: Container(
                          height: 0,
                          color: AppColors.bottomSubHeddingColor,
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            widget.countryCodeControler!.text = value!;
                            widget.selectedCountryCode = value;
                          });
                        },
                        items: widget.list
                            .map<DropdownMenuItem<String>>((String value) {
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
                   Text(
                    '',
                    style: TextStyle(
                        color: AppColors.heddingColor,
                        fontSize: Dimension.textSize_12,
                        fontWeight: FontWeight.w400),
                  ),
                 SizedBox(
                    height: Dimension.height3,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: SizedBox(
                      height: Dimension.screenHeight*0.09,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Mobile Number',
                          hintStyle: TextStyle(
                            color: AppColors.bottomSubHeddingColor,
                            fontSize: Dimension.textSize_12,
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
          height: Dimension.height10,
        ),
      ],
    );
  }
}
