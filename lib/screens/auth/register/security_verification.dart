import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nsb_remit/utils/constants/routes.dart';
import 'package:nsb_remit/widgets/common/button_row.dart';
import 'package:nsb_remit/widgets/common/common_layout.dart';
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
            index: 1,
            securityQuestionHintText: 'Enter your first PET Name',
            securityQuestionList: securityQuestionListOne,
            selectedQestion: selectedQestionOne,
            securityQuestionController: _securityQuestionOneController,
            securityQuestionAnswerController: _securityQuestionOneAnswer,
          ),
          const SizedBox(
            height: 20.0,
          ),
          //----------------------- second security question -----------------------
          securityQuestion(
              index: 2,
              securityQuestionHintText: 'Enter your Mother’s First Name',
              securityQuestionList: securityQuestionListOne,
              selectedQestion: selectedQestionTwo,
              securityQuestionController: _securityQuestionTwoController,
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
      required int index,
      required TextEditingController securityQuestionAnswerController,
      required TextEditingController securityQuestionController,
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
          padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 6.h),
          child: DropdownButton(
            value: index == 1 ? selectedQestionOne : selectedQestionTwo,
            elevation: 16,
            style: const TextStyle(color: AppColors.bottomSubHeddingColor),
            icon: Icon(
              Icons.arrow_drop_down,
              color: AppColors.textFieldBorderColor,
              size: 25.sp,
            ),
            underline: Container(
              height: 0,
              color: AppColors.bottomSubHeddingColor,
            ),
            onChanged: (String? value) {
              setState(() {
                securityQuestionController.text = value!;
                //securityQuestionList.remove(value);

                if (index == 1) {
                  selectedQestionOne = value;
                } else if (index == 2) {
                  selectedQestionTwo = value;
                }
              });
            },
            items: securityQuestionList
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Container(
                  padding: EdgeInsets.only(right: 100.w),
                  child: Text(
                    value,
                    style: TextStyle(
                        color: AppColors.subHeddingColor, fontSize: 14.r),
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
                EdgeInsets.symmetric(vertical: 30.h, horizontal: 10.w),
            hintText: securityQuestionHintText,
            hintStyle: TextStyle(
                color: const Color(0xff707070),
                fontSize: 12.r,
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
