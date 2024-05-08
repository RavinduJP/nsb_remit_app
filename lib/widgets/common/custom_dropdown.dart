import 'package:flutter/material.dart';
import 'package:nsb_remit/utils/constants/app_colors.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class CustomDropDown extends StatefulWidget {
  CustomDropDown({
    super.key,
    required this.itemList,
    required this.selectedItem,
    this.lableText = '',
     required this.countryController,
  });

  final List<String> itemList;
  String selectedItem;
  final String? lableText;
  final TextEditingController countryController;

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  // final screenHeight = MediaQuery.of(context).size.height;
  String selectedValue = list.first;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.lableText!,
          style: const TextStyle(
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
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 6.0),
          child: DropdownButton(
            value: widget.selectedItem,
            elevation: 16,
            style: const TextStyle(color: AppColors.bottomSubHeddingColor),
            icon: const Padding(
              padding: EdgeInsets.only(left: 150.0),
              child: Icon(
                Icons.arrow_drop_down,
                color: AppColors.textFieldBorderColor,
                size: 25.0,
              ),
            ),
            underline: Container(
              height: 0,
              color: AppColors.bottomSubHeddingColor,
            ),
            onChanged: (String? value) {
              setState(() {
                widget.countryController.text = value!;
                widget.selectedItem = value!;
              });
            },
            items:
                widget.itemList.map<DropdownMenuItem<String>>((String value) {
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
        ),
      ],
    );
  }
}
