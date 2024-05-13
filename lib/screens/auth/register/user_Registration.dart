import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nsb_remit/providers/user_details_provider.dart';
import 'package:nsb_remit/widgets/common/button_row.dart';
import 'package:nsb_remit/widgets/common/common_layout.dart';
import 'package:nsb_remit/widgets/common/custom_text_form_field.dart';
import 'package:provider/provider.dart';

import '../../../utils/constants/routes.dart';
import '../../../widgets/common/custom_dropdown.dart';

// const List<String> list = <String>['One', 'Two', 'Three', 'Four'];
// String selectedItem = 'One';

class UserRegistration extends StatefulWidget {
  const UserRegistration({super.key});

  @override
  State<UserRegistration> createState() => _UserRegistrationState();
}

class _UserRegistrationState extends State<UserRegistration> {
  List<String> list = <String>['Sri Lanka', 'India', 'USA', 'Austraia'];
  String selectedItem = 'Sri Lanka';

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _houseNameController = TextEditingController();
  final _streetNameController = TextEditingController();
  final _cityNameController = TextEditingController();
  final _countryNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      hedingTitle: 'User Registration',
      hedingSubTitle: 'Provide your personal details to \n create your account',
      body: Container(
        height: 430.h,
        color: Colors.amber,
        child: SingleChildScrollView(
          child: Column(
            children: [
              //----------------- first name field -----------------
              CustomTextFromField(
                controller: _firstNameController,
                lableText: 'First Name',
                hintText: 'Enter Your First Name',
              ),
              //----------------- last name field -----------------
              CustomTextFromField(
                controller: _lastNameController,
                lableText: 'Last Name',
                hintText: 'Enter Your Last Name',
              ),
              //----------------- house name field -----------------
              CustomTextFromField(
                controller: _houseNameController,
                lableText: 'House/ Apartment/ Unit',
                hintText: 'Enter Your House/ Apartment/ Unit',
              ),
              //----------------- street name field -----------------
              CustomTextFromField(
                controller: _streetNameController,
                lableText: 'Street Name',
                hintText: 'Enter Your Street Name',
              ),
              //----------------- city name field -----------------
              CustomTextFromField(
                controller: _cityNameController,
                lableText: 'City',
                hintText: 'Enter Your City',
              ),

              CustomDropDown(
                lableText: 'Country',
                itemList: list,
                selectedItem: selectedItem,
                countryController: _countryNameController,
              )
            ],
          ),
        ),
      ),
      bottomButton: ButtonRow(
        onTap: () {
          Provider.of<UserDetailsProvider>(context, listen: false)
              .addUserRegistrationDetails(
                  firstName: _firstNameController.text,
                  lastName: _lastNameController.text,
                  home: _houseNameController.text,
                  streetName: _streetNameController.text,
                  city: _cityNameController.text,
                  country: _countryNameController.text);
          final firstname =
              Provider.of<UserDetailsProvider>(context, listen: false)
                  .userDetails
                  .firstName;
          print(firstname);
          Navigator.of(context).pushNamed(Routes.scanPassportScreen);
        },
      ),
    );
  }
}
