import 'package:flutter/material.dart';
import 'package:nsb_remit/utils/constants/app_colors.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({super.key});

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String selectedValue = list.first;
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: selectedValue,
      elevation: 16,
      style: const TextStyle(color: AppColors.bottomSubHeddingColor),
        underline: Container(
          height: 2,
          color: AppColors.bottomSubHeddingColor,
        ),
        onChanged: (String? value) {
      setState(() {
        selectedValue = value!;
      });
    },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
