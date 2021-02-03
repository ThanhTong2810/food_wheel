import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:food_wheel/controller/drink_controller.dart';
import 'package:food_wheel/controller/food_controller.dart';
import 'package:food_wheel/controller/wheel_controller.dart';
import 'package:food_wheel/theme/colors.dart';
import 'package:food_wheel/theme/dimens.dart';
import 'package:food_wheel/utils/utils.dart';
import 'package:food_wheel/widget/animate_menu.dart';
import 'package:food_wheel/widget/app_button.dart';
import 'package:food_wheel/widget/app_text.dart';
import 'package:food_wheel/widget/card.dart';
import 'package:get/get.dart';

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
  final StreamController _dividerController = StreamController<int>();
  final FoodController foodController = Get.find();
  final DrinkController drinkController = Get.find();
  final WheelController wheelController = Get.find();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _dividerController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: Center(
          child: wheelController.items.isEmpty
              ? wheelController.listEmpty.value == true
                  ? buildButtonGetWheel()
                  : SizedBox()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    buildWheel(),
                    buildChangeWheel(),
                    buildButtonRoll(),
                  ],
                ),
        ),
      );
    });
  }

  Widget buildButtonGetWheel() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        AppButton(
          'Get Food Wheel',
          onTap: () async {
            wheelController.items = await foodController.getFood();
            wheelController.isFood.value = true;
            wheelController.listEmpty.value = false;
          },
        ),
        Dimens.height30,
        AppButton(
          'Get Drink Wheel',
          onTap: () async {
            wheelController.items = await drinkController.getDrink();
            wheelController.isFood.value = false;
            wheelController.listEmpty.value = false;
          },
        ),
      ],
    );
  }

  Widget buildButtonRoll() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: AppButton('Roll', onTap: () {
          wheelController.selected.value =
              Random().nextInt(wheelController.items.length);
          Future.delayed(Duration(seconds: 5, milliseconds: 500), () {
            showDialog(
                context: context,
                builder: (_) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        AppCard(
                          imageUrl: wheelController
                              .items[wheelController.selected.value].imageUrl,
                          name: wheelController
                              .items[wheelController.selected.value].name,
                          address: wheelController
                              .items[wheelController.selected.value].address,
                        ),
                      ],
                    ),
                  );
                });
          });
        }),
      ),
    );
  }

  Widget buildChangeWheel() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: AppButton(
        wheelController.isFood.value == true
            ? 'Go to drink wheel'
            : 'Go to food wheel',
        widthButton: getScreenWidth(context) / 3,
        onTap: wheelController.isFood.value == true
            ? () async {
                wheelController.items = await drinkController.getDrink();
                wheelController.isFood.value = false;
              }
            : () async {
                wheelController.items = await foodController.getFood();
                wheelController.isFood.value = true;
              },
      ),
    );
  }

  Widget buildWheel() {
    return Expanded(
      child: FortuneWheel(
        selected: wheelController.selected.value,
        items: wheelController.items.map((e) {
          return FortuneItem(
              child: AppText(
            text: e.name,
            color: AppColors.yellow,
          ));
        }).toList(),
      ),
    );
  }
}
