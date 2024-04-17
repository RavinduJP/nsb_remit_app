import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nsb_remit/widgets/common/custom_text_form_field.dart';

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
          body: CustomTextFromField(
            controller: _emailController,
            lableText: "Email Address",
            hintText: "Enter Your Email Addres",
          ),

        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Image.asset("assets/images/login_bottom_image.png"),
        )
      ],
    );
  }
}
