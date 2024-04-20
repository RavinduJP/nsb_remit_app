import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nsb_remit/widgets/common/custom_back_button.dart';
import 'package:nsb_remit/widgets/common/next_button.dart';

class ButtonRow extends StatelessWidget {
  const ButtonRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomBackButton(onTap: () {}),
        const SizedBox(width: 10.0,),
        NextButton(onTap: () {}) 
      ],
    );
  }
}
