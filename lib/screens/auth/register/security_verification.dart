import 'package:flutter/material.dart';
import 'package:nsb_remit/widgets/common/button_row.dart';
import 'package:nsb_remit/widgets/common/common_layout.dart';
import 'package:nsb_remit/widgets/common/custom_text_form_field.dart';

import '../../../utils/constants/app_colors.dart';

class SecurityVerification extends StatefulWidget {
  const SecurityVerification({super.key,});

  @override
  State<SecurityVerification> createState() => _SecurityVerificationState();
}

class _SecurityVerificationState extends State<SecurityVerification> {
  final _securityQuestionOneController = TextEditingController();
  final _securityQuestionTwoController = TextEditingController();
  final _securityQuestionOneAnswer = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      hedingTitle: 'Security Verification',
      hedingSubTitle:
          'Please fill the following details for your \nSecurity purpose ',
      body: Column(
        children: [
          CustomTextFromField(
            controller: _securityQuestionOneController,
            hintText: 'What is your first PET Name*',
            isEnableSuffixIcon: true,
            onTap: () {},
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 20.0),
          //   child: CustomTextFromField(
          //       controller: _securityQuestionOneAnswer,
          //       hintText: 'Enter your first PET Name'),
          // ),
          // TextFormField(
          //   decoration: InputDecoration(
          //     hintText: 'Enter your first PET Name',
          //     hintStyle: const TextStyle(
          //         color: Color(0xff707070),
          //         fontSize: 12.0,
          //         fontWeight: FontWeight.w400),
          //     enabledBorder: OutlineInputBorder(
          //       borderSide: BorderSide(color: borderColor),
          //       borderRadius: BorderRadius.circular(10.0),
          //     ),
          //     focusedBorder: OutlineInputBorder(
          //       borderSide: BorderSide(color: borderColor),
          //       borderRadius: BorderRadius.circular(10.0),
          //     ),
          //   ),
          //   cursorColor: AppColors.textFieldBorderColor,
          //   style: const TextStyle(color: AppColors.heddingColor),
          //   controller: _securityQuestionOneAnswer,
          // ),
          const SizedBox(
            height: 10.0,
          ),
          // CustomTextFromField(
          //   controller: _securityQuestionTwoController,
          //   hintText: 'What is your Mother’s First Name**',
          //   isEnableSuffixIcon: true,
          //   onTap: () {},
          // )
        ],
      ),
      bottomButton: ButtonRow(
        onTap: () {},
      ),
    );
  }
}
