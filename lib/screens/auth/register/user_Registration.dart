import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nsb_remit/providers/user_details_provider.dart';
import 'package:nsb_remit/widgets/common/button_row.dart';
import 'package:nsb_remit/widgets/common/common_layout.dart';
import 'package:nsb_remit/widgets/common/custom_text_form_field.dart';
import 'package:provider/provider.dart';

import '../../../utils/constants/routes.dart';
import '../../../utils/validation.dart';
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

  String? _firstNameFormFieldError;
  String? _lastNameFormFieldError;
  String? _houseNumFormFieldError;
  String? _streetNameFormFieldError;
  String? _cityNameFormFieldError;
  String? _countryNameFormFieldError;

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      hedingTitle: 'User Registration',
      hedingSubTitle: 'Provide your personal details to \n create your account',
      body: Container(
        height: 430.h,
        // color: Colors.amber,
        child: SingleChildScrollView(
          child: Column(
            children: [
              //----------------- first name field -----------------
              CustomTextFromField(
                controller: _firstNameController,
                lableText: 'First Name',
                hintText: 'Enter Your First Name',
                errorText: _firstNameFormFieldError,
                onChanged: (firstNameController) =>
                    setState(() => _firstNameFormFieldError = null),
              ),
              //----------------- last name field -----------------
              CustomTextFromField(
                controller: _lastNameController,
                lableText: 'Last Name',
                hintText: 'Enter Your Last Name',
                errorText: _lastNameFormFieldError,
                onChanged: (lastNameController) =>
                    setState(() => _lastNameFormFieldError = null),
              ),
              //----------------- house name field -----------------
              CustomTextFromField(
                controller: _houseNameController,
                lableText: 'House/ Apartment/ Unit',
                hintText: 'Enter Your House/ Apartment/ Unit',
                errorText: _houseNumFormFieldError,
                onChanged: (houseNameController) =>
                    setState(() => _houseNumFormFieldError = null),
              ),
              //----------------- street name field -----------------
              CustomTextFromField(
                controller: _streetNameController,
                lableText: 'Street Name',
                hintText: 'Enter Your Street Name',
                errorText: _streetNameFormFieldError,
                onChanged: (streetNameController) =>
                    setState(() => _streetNameFormFieldError = null),
              ),
              //----------------- city name field -----------------
              CustomTextFromField(
                controller: _cityNameController,
                lableText: 'City',
                hintText: 'Enter Your City',
                errorText: _cityNameFormFieldError,
                onChanged: (cityNameController) =>
                    setState(() => _cityNameFormFieldError = null),
              ),

              CustomDropDown(
                lableText: 'Country',
                itemList: list,
                selectedItem: selectedItem,
                countryController: _countryNameController,
                // onChanged: () =>
                //     setState(() =>  = null),
              )
            ],
          ),
        ),
      ),
      bottomButton: ButtonRow(
        onTap: () {
            _firstNameFormFieldError = Validation.firstNameValidator(
                context, _firstNameController.text);
                if(_firstNameFormFieldError != null) {
                  return setState(() {});
                }
            _lastNameFormFieldError =
                Validation.lastNameValidator(context, _lastNameController.text);
                if (_firstNameFormFieldError != null ||
              _lastNameFormFieldError != null) {
              return setState(() {});
            }
            _houseNumFormFieldError = Validation.houseNumberValidator(
                context, _houseNameController.text);
                if (_firstNameFormFieldError != null ||
              _lastNameFormFieldError != null ||
              _houseNumFormFieldError != null) {
              return setState(() {});
            }
            _streetNameFormFieldError = Validation.streetNameValidator(
                context, _streetNameController.text);
                if (_firstNameFormFieldError != null ||
              _lastNameFormFieldError != null ||
              _houseNumFormFieldError != null ||
              _streetNameFormFieldError != null) {
              return setState(() {});
            }
            _cityNameFormFieldError =
                Validation.cityNameValidator(context, _cityNameController.text);
                if (_firstNameFormFieldError != null ||
              _lastNameFormFieldError != null ||
              _houseNumFormFieldError != null ||
              _streetNameFormFieldError != null ||
              _cityNameFormFieldError != null) {
              return setState(() {});
            }
            _countryNameFormFieldError = Validation.countryNameValidator(
                context, _countryNameController.text);
                if (_firstNameFormFieldError != null ||
              _lastNameFormFieldError != null ||
              _houseNumFormFieldError != null ||
              _streetNameFormFieldError != null ||
              _cityNameFormFieldError != null ||
              _countryNameFormFieldError != null) {
              return setState(() {});
            }

          if (_firstNameFormFieldError == null &&
              _lastNameFormFieldError == null &&
              _houseNumFormFieldError == null &&
              _streetNameFormFieldError == null &&
              _cityNameFormFieldError == null &&
              _countryNameFormFieldError == null) {
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
          }
        },
      ),
    );
  }
}
