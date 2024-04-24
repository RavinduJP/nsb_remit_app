import 'package:flutter/material.dart';
import 'package:nsb_remit/utils/constants/app_colors.dart';
import 'package:nsb_remit/widgets/common/button_row.dart';
import 'package:nsb_remit/widgets/common/common_layout.dart';
import 'package:nsb_remit/widgets/common/common_text.dart';

class QuickSetUp extends StatelessWidget {
  const QuickSetUp({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      hedingTitle: 'Quick Setup',
      hedingSubTitle:
          'Please fill the following details for your \n Security purpose ',
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  alignment: Alignment.topLeft,
                  text: 'Biometrics',
                  whiteTextSize: 11.0,
                  fontWeight: FontWeight.w600,
                ),
                CommonText(
                  alignment: Alignment.topLeft,
                  text: 'Enable biometrics for secure and \nfast sign-in.',
                  whiteTextSize: 12.0,
                  fontWeight: FontWeight.w400,
                  textColor: AppColors.buttomSubHeddingColor,
                )
              ],
            ),
          ],
        ),
      ),
      bottomButton: ButtonRow(onTap: () {}),
    );
  }
}
