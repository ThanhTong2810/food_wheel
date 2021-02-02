
import 'package:flutter/material.dart';
import 'package:food_wheel/theme/colors.dart';
import 'package:food_wheel/utils/utils.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;

  GradientBackground({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: getScreenWidth(context),
          height: getScreenHeight(context),
          decoration: BoxDecoration(
          gradient: LinearGradient(colors: AppColors.gradientColorPrimary)
          ),
          child: this.child),
    );
  }
}
