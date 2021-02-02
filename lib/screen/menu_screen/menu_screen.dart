
import 'package:flutter/material.dart';
import 'package:food_wheel/constants/constants.dart';
import 'package:food_wheel/screen/drink_screen/drink_screen.dart';
import 'package:food_wheel/screen/food_screen/food_screen.dart';
import 'package:food_wheel/screen/wheel_screen/wheel_screen.dart';
import 'package:food_wheel/widget/animate_menu.dart';
import 'package:food_wheel/widget/menu.dart';
import 'package:get/get.dart';
class MenuMainScreen extends StatefulWidget {

  const MenuMainScreen({Key key}) : super(key: key);

  @override
  _MenuMainScreenState createState() => _MenuMainScreenState();
}

class _MenuMainScreenState extends State<MenuMainScreen> {
  final menu =  Menu(
    items: [
      MenuItem(
        id: Constants.WHEEL,
        title: 'Wheel',
      ),
      MenuItem(
        id: Constants.FOOD,
        title: 'Food',
      ),
      MenuItem(
        id: Constants.DRINK,
        title: 'Drink',
      ),
    ],
  );

  Rx<int> selectedMenuItemId = Rx<int>(Constants.WHEEL);
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: _buildContentView(),
      ),
    );
  }

  _buildContentView() {
    return Obx((){
      return ZoomScaffold(
        menuScreen: MenuScreen(
          menu: menu,
          selectedItemId: selectedMenuItemId.value,
          onMenuItemSelected: (int screenId) {
            switch (screenId) {
              case Constants.WHEEL:
                selectedMenuItemId.value = Constants.WHEEL;
                break;
              case Constants.FOOD:
                selectedMenuItemId.value = Constants.FOOD;
                break;
              case Constants.DRINK:
                selectedMenuItemId.value = Constants.DRINK;
                break;
              default:

            }
          },
        ),
        contentScreens: [myWheelScreen,myFoodScreen,myDrinkScreen],
        screenSelected: selectedMenuItemId.value,
      );
    });
  }
}