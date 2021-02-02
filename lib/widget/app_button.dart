
import 'package:flutter/material.dart';
import 'package:food_wheel/theme/colors.dart';
import 'package:food_wheel/utils/utils.dart';

import 'app_text.dart';

class AppButton extends StatelessWidget {
  final String titleButton;
  final double widthButton;
  final double heightButton;
  final Color textColor;
  final Function onTap;

  const AppButton(this.titleButton,
      {this.widthButton, this.heightButton, this.textColor, this.onTap});

  @override
  Widget build(BuildContext context) {
    return _buildAppButton(
        context, titleButton, widthButton, heightButton, textColor);
  }

  Widget _buildAppButton(BuildContext context, String titleButton,
      double widthButton, double heightButton, textColor) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width:
            widthButton != null ? widthButton : getScreenWidth(context) / 1.5,
        height:
            heightButton != null ? heightButton : getScreenWidth(context) / 10,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: AppColors.gradientColorPrimary),
            borderRadius: BorderRadius.circular(10)),
        child: Align(
          alignment: Alignment.center,
          child: AppText(
            color: textColor != null ? textColor : AppColors.white,
            text: titleButton,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
