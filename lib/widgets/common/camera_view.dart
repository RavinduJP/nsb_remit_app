import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:nsb_remit/utils/constants/app_colors.dart';

class CameraView extends StatefulWidget {
  const CameraView({super.key});

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: AppColors.buttomSubHeddingColor,
      strokeWidth: 2.0,
      dashPattern: const [15,4],
      radius: const Radius.circular(19.0),
      padding: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 200.0),
      borderPadding: const EdgeInsets.symmetric(horizontal: 30.0),
      borderType: BorderType.RRect,
      child: Container(
        child: const Text('please press to open camera'),
      ),
    );
  }
}
