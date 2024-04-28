import 'package:flutter/material.dart';
import 'package:nsb_remit/utils/constants/routes.dart';
import 'package:nsb_remit/widgets/common/button_row.dart';
import 'package:nsb_remit/widgets/common/common_layout.dart';
import 'package:nsb_remit/widgets/common/custom_text_form_field.dart';
import 'package:provider/provider.dart';

import '../../../providers/security_verification_provider.dart';
import '../../../utils/constants/app_colors.dart';

class SecurityVerification extends StatefulWidget {
  const SecurityVerification({
    super.key,
  });

  @override
  State<SecurityVerification> createState() => _SecurityVerificationState();
}

class _SecurityVerificationState extends State<SecurityVerification> {
  final _securityQuestionOneController = TextEditingController();
  final _securityQuestionTwoController = TextEditingController();
  final _securityQuestionOneAnswer = TextEditingController();
  final _securityQuestionTwoAnswer = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      hedingTitle: 'Security Verification',
      hedingSubTitle:
          'Please fill the following details for your \nSecurity purpose ',
      body: Column(
        children: [
          //----------------------- first security question -----------------------
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: CustomTextFromField(
              controller: _securityQuestionOneController,
              hintText: 'What is your first PET Name*',
              isEnableSuffixIcon: true,
              onTap: () {},
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
              hintText: 'Enter your first PET Name',
              hintStyle: const TextStyle(
                  color: Color(0xff707070),
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400),
              border: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: AppColors.textFieldBorderColor),
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: AppColors.textFieldBorderColor),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: AppColors.textFieldBorderColor),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            cursorColor: AppColors.textFieldBorderColor,
            style: const TextStyle(color: AppColors.heddingColor),
            controller: _securityQuestionOneAnswer,
          ),
          const SizedBox(
            height: 10.0,
          ),
          //----------------------- second security question -----------------------
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: CustomTextFromField(
              controller: _securityQuestionTwoController,
              hintText: 'What is your Mother’s First Name*',
              isEnableSuffixIcon: true,
              onTap: () {},
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
              hintText: 'Enter your Mother’s First Name',
              hintStyle: const TextStyle(
                  color: Color(0xff707070),
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400),
              border: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: AppColors.textFieldBorderColor),
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: AppColors.textFieldBorderColor),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: AppColors.textFieldBorderColor),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            cursorColor: AppColors.textFieldBorderColor,
            style: const TextStyle(color: AppColors.heddingColor),
            controller: _securityQuestionTwoAnswer,
          ),
        ],
      ),
      bottomButton: ButtonRow(
        onTap: () {
          Navigator.of(context).pushNamed(Routes.createPinScreen);
          context
              .read<SecurityVerificationProvider>()
              .addSecurityQuestionDetails(
                  securityQuestionOne: _securityQuestionOneController.text,
                  securityQuestionTwo: _securityQuestionTwoController.text,
                  securityQuestionAnswerOne: _securityQuestionOneAnswer.text,
                  securityQuestionAnswerTwo: _securityQuestionTwoAnswer.text);
        },
      ),
    );
  }
}
