
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:food_wheel/localization/flutter_localizations.dart';
import 'package:food_wheel/widget/android_dialog.dart';
import 'package:food_wheel/widget/ios_dialog.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

/// This method is used when we need to call a method after build() function is completed.
void onWidgetBuildDone(function) {
  SchedulerBinding.instance.addPostFrameCallback((_) {
    function();
  });
}

String capitalizeString(String string) {
  return "${string[0].toUpperCase()}${string.substring(1).toLowerCase()}";
}

double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

String formatDate(DateTime dateTime) {
  var formatter = DateFormat('dd/MM/yyyy');
  String formatted = formatter.format(dateTime);
  return formatted;
}

String addCountryCode(String phoneNumber) {
  String phoneNumberWithCountryCode = phoneNumber.replaceFirst('0', '+84', 0);
  return phoneNumberWithCountryCode;
}

String removeCountryCode(String phoneNumber) {
  String phoneNumberWithoutCountryCode;
  if (phoneNumber != null) {
    phoneNumberWithoutCountryCode = phoneNumber.replaceFirst('+84', '0', 0);
  } else {
    phoneNumberWithoutCountryCode = 'Guest';
  }

  return phoneNumberWithoutCountryCode;
}

void hideKeyboard(BuildContext context) {
  FocusScope.of(context).requestFocus(new FocusNode());
}

showConfirmDialog(BuildContext context,
    {String title, String content, Function cancel, Function confirm}) {
  if (Platform.isIOS) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return IOSDialog(
            title: title,
            content: content,
            cancel: cancel,
            confirm: () {
              Navigator.pop(context);
              confirm();
            },
          );
        });
  } else {
    showDialog(
        context: context,
        builder: (context) {
          return AndroidDialog(
            title: title,
            content: content,
            cancel: cancel,
            confirm: () {
              Navigator.pop(context);
              confirm();
            },
          );
        });
  }
}
