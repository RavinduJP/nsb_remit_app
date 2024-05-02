import 'package:flutter/material.dart';
import 'package:nsb_remit/utils/constants/routes.dart';
import 'package:nsb_remit/widgets/common/button_row.dart';
import 'package:nsb_remit/widgets/common/common_layout.dart';
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

List<String> securityQuestionListOne = <String>[
  'What was the name of your first pet?',
  'Where were you born',
  'What was your childhood nickname?'
];
List<String> securityQuestionListTwo = <String>[
  'What was the name of your first pet?',
  'Where were you born',
  'What was your childhood nickname?'
];
String selectedQestionOne = 'What was the name of your first pet?';
String selectedQestionTwo = 'What was the name of your first pet?';

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
          securityQuestion(
            securityQuestionHintText: 'Enter your first PET Name',
            securityQuestionList: securityQuestionListOne,
            selectedQestion: selectedQestionOne,
            securityQuestionAnswerController: _securityQuestionOneAnswer,
          ),
          const SizedBox(
            height: 20.0,
          ),
          //----------------------- second security question -----------------------
          securityQuestion(
              securityQuestionHintText: 'Enter your Mother’s First Name',
              securityQuestionList: securityQuestionListTwo,
              selectedQestion: selectedQestionTwo,
              securityQuestionAnswerController: _securityQuestionTwoAnswer),
        ],
      ),
      bottomButton: ButtonRow(
        onTap: () {
          Navigator.of(context).pushNamed(Routes.createPinScreen);
          // context
          //     .read<SecurityVerificationProvider>()
          //     .addSecurityQuestionDetails(
          //         securityQuestionOne: _securityQuestionOneController.text,
          //         securityQuestionTwo: _securityQuestionTwoController.text,
          //         securityQuestionAnswerOne: _securityQuestionOneAnswer.text,
          //         securityQuestionAnswerTwo: _securityQuestionTwoAnswer.text);
        },
      ),
    );
  }

  Column securityQuestion(
      {required String securityQuestionHintText,
      required TextEditingController securityQuestionAnswerController,
      required List<String> securityQuestionList,
      required String selectedQestion}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.maxFinite,
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
            value: selectedQestion,
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
                selectedQestion = value!;
              });
            },
            items: securityQuestionList
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Container(
                  padding: const EdgeInsets.only(right: 100.0),
                  child: Text(
                    value,
                    style: const TextStyle(
                        color: AppColors.subHeddingColor, fontSize: 14.0),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
        TextFormField(
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
            hintText: securityQuestionHintText,
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
          controller: securityQuestionAnswerController,
        ),
      ],
    );
  }
}
