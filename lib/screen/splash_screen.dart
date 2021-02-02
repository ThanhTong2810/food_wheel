import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_wheel/res/images/images.dart';
import 'package:food_wheel/screen/menu_screen/menu_screen.dart';
import 'package:food_wheel/theme/colors.dart';
import 'package:food_wheel/utils/utils.dart';
import 'package:food_wheel/widget/fade_container.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{

  Timer timer;
  List<String> category;
  List<String> priority = ['Slow', 'Medium', 'High'];
  List<String> status = ['Processing', 'Done', 'Pending'];

  ///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~///
  ///           OVERRIDE METHODS           ///
  ///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~///
  @override
  void initState() {
    super.initState();
    onWidgetBuildDone(onBuildDone);
  }

  @override
  void dispose() {
    if (timer != null) {
      timer.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final logoSize = getScreenWidth(context) / 2;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: FadeContainer(
          child: Image.asset(
            Images.logo,
            width: logoSize,
            height: logoSize,
          ),
        ),
      ),
    );
  }

  ///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~///
  ///           BUILD METHODS              ///
  ///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~///

  ///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~///
  ///             OTHER METHODS            ///
  ///~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~///
  onBuildDone() async {
    /// Delay 3 seconds, then navigate to Login screen

    timer=Timer.periodic(Duration(seconds: 2), (timer) async {
        _navigateToMainScreen();
    });
  }

  _navigateToMainScreen() {
    Get.offAll(MenuMainScreen());
  }
}
