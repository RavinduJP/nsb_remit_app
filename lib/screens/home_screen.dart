import 'package:flutter/material.dart';
import 'package:nsb_remit/widgets/common/button_row.dart';

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
    return const Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimension.screenWidthFactor,
              vertical: Dimension.screenWidthFactor),
          child: Column(
            children: [
              HeaderWidget(),
              SizedBox(height: 50.0,),
              ButtonRow(),
            ],
          ),
        ),
      ),
    );
  }
}
