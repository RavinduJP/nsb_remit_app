import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nsb_remit/utils/constants/app_colors.dart';
import 'package:nsb_remit/widgets/common/common_button.dart';
import 'package:nsb_remit/widgets/common/custom_text_form_field.dart';
import 'package:nsb_remit/widgets/common/common_text.dart';

import '../../../widgets/common/common_layout.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CommonLayout(
          hedingTitle: "Log In",
          hedingSubTitle:
              'Please provide your Credentials to \n Log In with NSB Remit',
          maxLine: 2,
          body: Column(
            children: [
              CustomTextFromField(
                controller: _emailController,
                lableText: "Email Address",
                hintText: "Enter Your Email Addres",
              ),
              const SizedBox(
                height: 20.0,
              ),
              const CommonText(
                text: 'Enter Your PIN*',
                whiteTextSize: 11.0,
                alignment: Alignment.topLeft,
                // textColor: AppColors.secondary,
              ),
              const SizedBox(
                height: 70.0,
                child: Text('enterpin space'),
              ),
              const Row(
                children: [
                  CommonText(
                    text: 'Forgot your ',
                    whiteTextSize: 11.0,
                    // alignment: Alignment.topLeft
                  ),
                  CommonText(
                    text: 'PIN?',
                    whiteTextSize: 11.0,
                    // alignment: Alignment.topLeft,
                    textColor: AppColors.secondary,
                  ),
                ],
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 15.0,
                  ),
                  CommonButton(
                    bordercolor: AppColors.secondary,
                    borderWidth: 1.0,
                    color: AppColors.secondary,
                    boxShape: BoxShape.rectangle,
                    buttonText: 'Sign In',
                    btnTextColor: AppColors.primary,
                    btnFontSize: 14.0,
                    btnFontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonText(
                        text: "Don’t have Account? ",
                        whiteTextSize: 11.0,
                      ),
                      CommonText(
                        text: 'Sign Up',
                        whiteTextSize: 11.0,
                        textColor: AppColors.secondary,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Image.asset("assets/images/login_bottom_image.png"),
        ),
      ],
    );
  }
}
