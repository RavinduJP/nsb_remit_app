import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nsb_remit/utils/constants/app_colors.dart';
import 'package:nsb_remit/utils/constants/asset_paths.dart';
import 'package:nsb_remit/utils/constants/routes.dart';
import 'package:nsb_remit/widgets/common/common_text.dart';
import '../utils/constants/dimensions.dart';
import '../widgets/common/header_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _quickTransferIconController = ScrollController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Dimension.screenWidthFactor),
          child: Column(
            children: [
              const HeaderWidget(),
              const SizedBox(
                height: 50.0,
              ),
              const SizedBox(
                height: 50.0,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonText(
                    text: 'Quick Transfer',
                    whiteTextSize: 14.0,
                    fontWeight: FontWeight.w600,
                    textColor: AppColors.heddingColor,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: CommonText(
                      text: 'See All',
                      whiteTextSize: 14.0,
                      fontWeight: FontWeight.w600,
                      textColor: AppColors.secondary,
                    ),
                  ),
                ],
              ),
              Container(
                width: screenWidth,
                height: screenHeight * 0.12,
                child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: screenHeight * 0.09,
                        width: screenHeight * 0.09,
                        decoration: BoxDecoration(
                          color: AppColors.quickTransferViewColor,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: const Center(
                          child: Text(
                            'SG',
                            style: TextStyle(
                              color: Color(0xff707070),
                              fontSize: 24.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  reverse: true,
                  controller: _quickTransferIconController,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: homePageIconBtn(
                      btnImage: AssetPaths.homePageHistoryIcon,
                      btnPadding: screenWidth * 0.04,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.2, vertical: screenHeight * 0.03),
                      // padding: EdgeInsets.symmetric(horizontal: Dimension.screenHeight*0.2, vertical: Dimension.screenWidth*0.03),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.0),
                          color: AppColors.secondary,
                          shape: BoxShape.rectangle),
                      child: const Text(
                        'Send Money',
                        style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primary),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: homePageIconBtn(
                      btnImage: AssetPaths.homePageMoreIcon,
                      btnPadding: screenWidth * 0.04,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(Routes.logInScreen);
                  },
                  child: Text('BACK')),
            ],
          ),
        ),
      ),
    );
  }

  Container homePageIconBtn({
    required String btnImage,
    required double btnPadding,
  }) {
    return Container(
      padding: EdgeInsets.all(btnPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9.0),
        color: AppColors.secondary,
      ),
      child: Image.asset(
        btnImage,
        alignment: Alignment.center,
        height: 30.0,
        width: 30.0,
      ),
    );
  }
}
