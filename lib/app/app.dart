
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:food_wheel/controller/app_controller.dart';
import 'package:food_wheel/controller/drink_controller.dart';
import 'package:food_wheel/controller/food_controller.dart';
import 'package:food_wheel/controller/wheel_controller.dart';
import 'package:food_wheel/localization/flutter_localizations_delegate.dart';
import 'package:food_wheel/screen/splash_screen.dart';
import 'package:food_wheel/theme/colors.dart';
import 'package:food_wheel/theme/fonts.dart';
import 'package:get/get.dart';

class WheelApp extends StatefulWidget {
  @override
  State<WheelApp> createState() => _AppState();
}

class _AppState extends State<WheelApp> {
  final AppController appController = Get.put(AppController());

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    appController.getDefaultLanguage();
    return Obx(
      () {
        return GetMaterialApp(
            initialBinding: BindingsBuilder(() {
              Get.put(WheelController());
              Get.put(FoodController());
              Get.put(DrinkController());
            }),
            color: AppColors.primary,
            debugShowCheckedModeBanner: false,
            title: '',
            supportedLocales: [
              Locale('vi', 'VN'),
              Locale('en', 'US'),
            ],
            locale: appController.locale.value,
            localizationsDelegates: [
              FlutterLocalizationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            theme: ThemeData(
                primaryColor: AppColors.primary,
                accentColor: AppColors.primary,
                fontFamily: Fonts.Lato,
                primaryIconTheme: IconThemeData(color: Colors.white)),
            home: SplashScreen());
      },
    );
  }
}
