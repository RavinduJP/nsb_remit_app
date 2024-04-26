import 'package:flutter/material.dart';
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
List<String> dialCodeList = <String>['+94', 'Two', 'Three', 'Four'];
String selecteddialCode = '+94';

class _SignUpDetailsState extends State<SignUpDetails> {
  final _passportNumbeerController = TextEditingController();
  final _nicNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileNumberController = TextEditingController();

  String currentOption = options[0];
  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      hedingTitle: 'SignUp Details',
      hedingSubTitle:
          'Please provide below Identification details to \n start the signup process.',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CommonText(
            text: 'How we identify you?',
            whiteTextSize: 12.0,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              width: 170,
              child: RadioListTile(
                  activeColor: AppColors.secondary,
                  title: const Text(
                    'Passport',
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        color: AppColors.heddingColor),
                  ),
                  value: options[0],
                  groupValue: currentOption,
                  onChanged: (value) {
                    setState(() {
                      currentOption = value.toString();
                    });
                  }),
            ),
            SizedBox(
              width: 170,
              child: RadioListTile(
                  activeColor: AppColors.secondary,
                  title: const Text(
                    'Other',
                    style: TextStyle(
                        fontSize: 14.0,
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
          const SizedBox(
            height: 5.0,
          ),
          InternationalMobileNumberField(
            borderColor: AppColors.textFieldBorderColor,
            list: dialCodeList,
            selectedCountryCode: selecteddialCode,
            mobileNumberControler: _mobileNumberController,
          ),
          CustomTextFromField(
            controller: _emailController,
            lableText: 'Email Address',
            hintText: 'Enter Your Emails Addres',
            keyboardType: TextInputType.emailAddress,
          ),
        ],
      ),
      bottomButton: ButtonRow(
        onTap: () {
          print(currentOption);
          print(_passportNumbeerController.text);
          print(_nicNumberController.text);
          print(selecteddialCode);
          print(_mobileNumberController.text);
          print(_emailController.text);
          // context.read<UserDetailsProvider>().addSignUpDetails(
          //       documentType: currentOption,
          //       passportNumber: _passportNumbeerController.text,
          //       nicNumber: _nicNumberController.text,
          //       selectedCountryCode: selecteddialCode,
          //       mobileNumber: _mobileNumberController.text,
          //       emailAddress: _emailController.text,
          //     );
          Navigator.of(context).pushNamed(Routes.otpVerificationScreen);
        },
      ),
    );
  }
}
