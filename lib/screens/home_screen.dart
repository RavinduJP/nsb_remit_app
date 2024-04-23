import 'package:flutter/material.dart';
import 'package:nsb_remit/utils/constants/app_colors.dart';
import 'package:nsb_remit/widgets/common/common_button.dart';
import '../utils/constants/dimensions.dart';
import '../widgets/common/header_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Dimension.screenWidthFactor,
              vertical: Dimension.screenWidthFactor),
          child: Column(
            children: [
              const HeaderWidget(),
              const SizedBox(
                height: 50.0,
              ),
              const SizedBox(
                height: 50.0,
              ),
              CommonButton(
                bordercolor: AppColors.secondary,
                borderWidth: 0.0,
                color: AppColors.secondary,
                boxShape: BoxShape.rectangle,
                buttonText: 'Send Money',
                btnTextColor: AppColors.primary,
                btnFontSize: 15.0,
                btnFontWeight: FontWeight.w600,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
