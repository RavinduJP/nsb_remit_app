import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nsb_remit/utils/constants/app_colors.dart';
import 'package:nsb_remit/widgets/common/button_row.dart';
import 'package:nsb_remit/widgets/common/common_layout.dart';
import 'package:nsb_remit/widgets/common/common_text.dart';
import 'package:nsb_remit/widgets/common/custom_text_form_field.dart';
import 'package:nsb_remit/widgets/common/international_mobile_number_field.dart';
import 'package:provider/provider.dart';

import '../../../providers/user_details_provider.dart';
import '../../../utils/constants/routes.dart';

class SignUpDetails extends StatefulWidget {
  const SignUpDetails({super.key});

  @override
  State<SignUpDetails> createState() => _SignUpDetailsState();
}

List options = ['Passport', 'Other'];
// List<String> dialCodeList = <String>['+94', 'Two', 'Three', 'Four'];
List<String> dialCodeList = <String>['+94', '+53', '+55', '+420'];
String selecteddialCode = '+94';

class _SignUpDetailsState extends State<SignUpDetails> {
  final _passportNumbeerController = TextEditingController();
  final _nicNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _countryCodeController = TextEditingController();
  final _mobileNumberController = TextEditingController();

  String currentOption = options[0];
  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      hedingTitle: 'SignUp Details',
      hedingSubTitle:
          'Please provide below Identification details to \n start the signup process.',
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CommonText(
              text: 'How we identify you?',
              whiteTextSize: 12.r,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                width: 170,
                child: RadioListTile(
                  activeColor: AppColors.secondary,
                  title: Text(
                    'Passport',
                    style: TextStyle(
                        fontSize: 14.r,
                        fontWeight: FontWeight.w400,
                        color: AppColors.heddingColor),
                  ),
                  value: options[0],
                  groupValue: currentOption,
                  onChanged: (value) {
                    setState(() {
                      currentOption = value.toString();
                    });
                  },
                ),
              ),
              SizedBox(
                width: 170.w,
                child: RadioListTile(
                    activeColor: AppColors.secondary,
                    title: Text(
                      'Other',
                      style: TextStyle(
                          fontSize: 14.r,
                          fontWeight: FontWeight.w400,
                          color: AppColors.heddingColor),
                    ),
                    value: options[1],
                    groupValue: currentOption,
                    onChanged: (value) {
                      setState(() {
                        currentOption = value.toString();
                      });
                    }),
              )
            ]),
            CustomTextFromField(
              controller: _passportNumbeerController,
              lableText: 'Passport Number',
              hintText: 'Enter Your Passport Number',
            ),
            CustomTextFromField(
              controller: _nicNumberController,
              lableText: 'NIC Number',
              hintText: 'Enter Your NIC Number',
            ),
            InternationalMobileNumberField(
              borderColor: AppColors.textFieldBorderColor,
              list: dialCodeList,
              selectedCountryCode: selecteddialCode,
              mobileNumberControler: _mobileNumberController,
              countryCodeControler: _countryCodeController,
            ),
            CustomTextFromField(
              controller: _emailController,
              lableText: 'Email Address',
              hintText: 'Enter Your Emails Addres',
              keyboardType: TextInputType.emailAddress,
            ),
          ],
        ),
      ),
      bottomButton: ButtonRow(
        onTap: () {
          Provider.of<UserDetailsProvider>(context, listen: false)
              .addSignUpDetails(
            documentType: currentOption,
            passportNumber: _passportNumbeerController.text,
            nicNumber: _nicNumberController.text,
            selectedCountryCode: _countryCodeController.text,
            mobileNumber: _mobileNumberController.text,
            emailAddress: _emailController.text,
            passportImage: '',
            visaImage: '',
            selfieImage: '',
          );
          final nic = Provider.of<UserDetailsProvider>(context, listen: false)
              .userDetails
              .nicNumber;
          print(nic);
          print(_countryCodeController.text);
          Navigator.of(context).pushNamed(Routes.otpVerificationScreen);
        },
      ),
    );
  }
}
