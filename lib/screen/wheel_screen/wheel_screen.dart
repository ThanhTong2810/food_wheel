import 'package:flutter/material.dart';
import 'package:food_wheel/widget/animate_menu.dart';

final Screen myWheelScreen = Screen(
    title: 'Wheel',
    contentBuilder: (BuildContext context) {
      return WheelScreen();
    });

class WheelScreen extends StatefulWidget {
  @override
  _WheelScreenState createState() => _WheelScreenState();
}

class _WheelScreenState extends State<WheelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
