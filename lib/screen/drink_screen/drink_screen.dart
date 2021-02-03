import 'package:flutter/material.dart';
import 'package:food_wheel/controller/drink_controller.dart';
import 'package:food_wheel/localization/flutter_localizations.dart';
import 'package:food_wheel/model/drink_model.dart';
import 'package:food_wheel/theme/colors.dart';
import 'package:food_wheel/utils/utils.dart';
import 'package:food_wheel/widget/animate_menu.dart';
import 'package:food_wheel/widget/app_button.dart';
import 'package:food_wheel/widget/app_text.dart';
import 'package:food_wheel/widget/card.dart';
import 'package:get/get.dart';

final Screen myDrinkScreen = Screen(
    title: 'Drink',
    contentBuilder: (BuildContext context) {
      return DrinkScreen();
    });

class DrinkScreen extends StatefulWidget {
  @override
  _DrinkScreenState createState() => _DrinkScreenState();
}

class _DrinkScreenState extends State<DrinkScreen> {
  final DrinkController drinkController=Get.find();

  TextEditingController nameTextEditingController = new TextEditingController();
  TextEditingController addressTextEditingController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    onWidgetBuildDone(() async{
      drinkController.listDrink=await drinkController.getDrink();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx((){
      return Scaffold(
        body: ListView(
          padding: EdgeInsets.zero,
          children: drinkController.listDrink.map((e){
            return AppCard(
              imageUrl: e.imageUrl,
              name: e.name,
              address: e.address,
            );
          }).toList(),
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: 'add drink',
          child: Icon(Icons.add_business_sharp),
          backgroundColor: AppColors.primary,
          onPressed: () {
            // foodController.image.value=null;
            // nameTextEditingController.text='';
            // addressTextEditingController.text='';
            // foodController.msgErr.value='';
            // _addNoteModalBottomSheet(context);
          },
        ),
      );
    });
  }

  // void _addNoteModalBottomSheet(context) {
  //   showModalBottomSheet(
  //       isScrollControlled: true,
  //       context: context,
  //       builder: (BuildContext context) {
  //         return Padding(
  //           padding: EdgeInsets.only(
  //               bottom: MediaQuery.of(context).viewInsets.bottom),
  //           child: SingleChildScrollView(
  //             child: Container(
  //               padding: EdgeInsets.symmetric(horizontal: 5),
  //               child: Wrap(
  //                 children: <Widget>[
  //                   TextFormField(
  //                     controller: nameTextEditingController,
  //                     decoration: InputDecoration(
  //                       icon: Icon(Icons.add_comment_outlined),
  //                       hintText: 'Enter name',
  //                     ),
  //                   ),
  //                   TextFormField(
  //                     controller: addressTextEditingController,
  //                     decoration: InputDecoration(
  //                       icon: Icon(Icons.add_comment_outlined),
  //                       hintText: 'Enter address',
  //                     ),
  //                   ),
  //                   Center(
  //                     child: Padding(
  //                       padding: EdgeInsets.symmetric(vertical: 20),
  //                       child: Container(
  //                         child: AppButton(
  //                             FlutterLocalizations.of(context)
  //                                 .getString(context, 'confirm'),
  //                             onTap: (){}
  //                         ),
  //                       ),
  //                     ),
  //                   )
  //                 ],
  //               ),
  //             ),
  //           ),
  //         );
  //       });
  // }
}