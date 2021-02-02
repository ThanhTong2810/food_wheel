
import 'package:flutter/material.dart';
import 'package:food_wheel/res/images/images.dart';
import 'package:food_wheel/theme/dimens.dart';
import 'package:food_wheel/widget/fade_container.dart';
class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logoSize = Dimens.getLogoSize(context);
    return Padding(
      padding: EdgeInsets.only(top: logoSize),
      child: FadeContainer(child: Image.asset(Images.logo, width: logoSize,)),
    );
  }
}
