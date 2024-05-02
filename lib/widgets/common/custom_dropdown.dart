import 'package:flutter/material.dart';
import 'package:nsb_remit/utils/constants/app_colors.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class CustomDropDown extends StatefulWidget {
  CustomDropDown({
    super.key,
    required this.itemList,
    required this.selectedItem,
  });

  final List<String> itemList;
  String selectedItem;

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  // final screenHeight = MediaQuery.of(context).size.height;
  String selectedValue = list.first;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.textFieldBorderColor,
          width: 1.0,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 6.0),
      child: DropdownButton(
        value: widget.selectedItem,
        elevation: 16,
        style: const TextStyle(color: AppColors.bottomSubHeddingColor),
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
            widget.selectedItem = value!;
          });
        },
        items: widget.itemList.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(right: 100.0),
                child: Text(
                  value,
                  style: const TextStyle(
                      color: AppColors.subHeddingColor, fontSize: 14.0),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
