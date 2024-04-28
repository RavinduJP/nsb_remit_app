import 'package:flutter/material.dart';
import 'package:nsb_remit/providers/user_details_provider.dart';
import 'package:nsb_remit/utils/constants/routes.dart';
import 'package:nsb_remit/widgets/common/button_row.dart';
import 'package:nsb_remit/widgets/common/common_layout.dart';
import 'package:nsb_remit/widgets/common/common_text.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../utils/constants/app_colors.dart';

class CreatePin extends StatelessWidget {
  const CreatePin({super.key});

  @override
  Widget build(BuildContext context) {
    final createPinController = TextEditingController();
    final confirmPinController = TextEditingController();
    return CommonLayout(
      hedingTitle: 'Create PIN',
      hedingSubTitle: 'You can setup PIN to login your \n account with ease!',
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80.0),
        child: Column(
          children: [
            CreatePinField(
                controller: createPinController, pinHeader: 'Enter Your PIN*'),
            const SizedBox(
              height: 20.0,
            ),
            CreatePinField(
                controller: confirmPinController,
                pinHeader: 'Confirm Your PIN*'),
          ],
        ),
      ),
      bottomButton: ButtonRow(onTap: () {
        // print(context.read<UserDetailsProvider>().userDetails.emailAddress);
        Navigator.of(context).pushNamed(Routes.quickSetUpScreen);
      }),
    );
  }
}

class CreatePinField extends StatelessWidget {
  const CreatePinField({
    super.key,
    required this.controller,
    required this.pinHeader,
  });

  final TextEditingController controller;
  final String pinHeader;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonText(
          text: pinHeader,
          whiteTextSize: 11.0,
          alignment: Alignment.topLeft,
        ),
        PinCodeTextField(
          controller: controller,
          appContext: context,
          length: 4,
          obscureText: true,
          obscuringCharacter: '*',
          textStyle: const TextStyle(
            color: AppColors.heddingColor,
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
          ),
          hintCharacter: '-',
          hintStyle: const TextStyle(
              color: AppColors.heddingColor,
              fontSize: 20.0,
              fontWeight: FontWeight.w600),
          showCursor: true,
          keyboardType: TextInputType.number,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.underline,
            fieldHeight: 36.0,
            fieldWidth: 50.0,
            inactiveColor: AppColors.subHeddingColor,
            activeColor: AppColors.subHeddingColor,
            selectedColor: AppColors.subHeddingColor,
            disabledColor: AppColors.subHeddingColor,
          ),
          cursorHeight: 24.0,
        ),
      ],
    );
  }
}
