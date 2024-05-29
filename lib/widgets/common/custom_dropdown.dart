import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nsb_remit/utils/constants/app_colors.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({
    super.key,
    required this.itemList,
    required this.selectedItem,
    this.lableText = '',
    required this.countryController,
  });

  final List<String> itemList;
  final String selectedItem;
  final String? lableText;
  final TextEditingController countryController;

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  // final screenHeight = MediaQuery.of(context).size.height;
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.lableText!,
          style: TextStyle(
              color: const Color(0xffF5F5F5),
              fontSize: 12.r,
              fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: 5.h,
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
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 3.h),
          child: DropdownButton(
            value: selectedValue ?? widget.selectedItem,
            elevation: 16,
            style: const TextStyle(color: AppColors.bottomSubHeddingColor),
            dropdownColor: AppColors.secondary,
            icon: Padding(
              padding: EdgeInsets.only(left: 150.sp),
              child: Icon(
                Icons.arrow_drop_down,
                color: AppColors.textFieldBorderColor,
                size: 25.sp,
              ),
            ),
            underline: Container(
              height: 0,
              color: AppColors.bottomSubHeddingColor,
            ),
            onChanged: (String? value) {
              setState(() {
                widget.countryController.text = value!;
                selectedValue = value;
              });
            },
            items:
                widget.itemList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Padding(
                  padding: EdgeInsets.only(right: 100.w),
                  child: Text(
                    value,
                    style: TextStyle(
                        color: selectedValue == value
                            ? AppColors.whiteColor
                            : AppColors.subHeddingColor,
                        fontSize: 14.r),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
