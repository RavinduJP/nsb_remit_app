import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nsb_remit/utils/constants/app_colors.dart';
import 'package:nsb_remit/widgets/common/button_row.dart';
import 'package:nsb_remit/widgets/common/common_layout.dart';
import 'package:nsb_remit/widgets/common/common_text.dart';
import 'package:nsb_remit/widgets/common/custom_text_form_field.dart';
import 'package:nsb_remit/widgets/common/international_mobile_number_field.dart';

import '../../../utils/constants/routes.dart';

class SignUpDetails extends StatefulWidget {
  const SignUpDetails({super.key});

  @override
  State<SignUpDetails> createState() => _SignUpDetailsState();
}

class _SignUpDetailsState extends State<SignUpDetails> {
  final _passportNumbeerController = TextEditingController();
  final _NicNumberController = TextEditingController();
  final _emailController = TextEditingController();

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
          CustomTextFromField(
            controller: _passportNumbeerController,
            lableText: 'Passport Number',
            hintText: 'Enter Your Passport Number',
          ),
          CustomTextFromField(
            controller: _NicNumberController,
            lableText: 'NIC Number',
            hintText: 'Enter Your NIC Number',
          ),
          const SizedBox(
            height: 5.0,
          ),
          const InternationalMobileNumberField(
              borderColor: AppColors.textFieldBorderColor),
          CustomTextFromField(
              controller: _emailController,
              lableText: 'Email Address',
              hintText: 'Enter Your Emails Addres'),
        ],
      ),
      bottomButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ButtonRow(
          onTap: () {
            Navigator.of(context).pushNamed(Routes.otpVerificationScreen);
          },
        ),
      ),
    );
  }
}
