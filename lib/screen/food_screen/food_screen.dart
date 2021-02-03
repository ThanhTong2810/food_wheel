import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_wheel/controller/food_controller.dart';
import 'package:food_wheel/localization/flutter_localizations.dart';
import 'package:food_wheel/model/food_model.dart';
import 'package:food_wheel/theme/colors.dart';
import 'package:food_wheel/theme/dimens.dart';
import 'package:food_wheel/utils/utils.dart';
import 'package:food_wheel/widget/animate_menu.dart';
import 'package:food_wheel/widget/app_button.dart';
import 'package:food_wheel/widget/app_text.dart';
import 'package:food_wheel/widget/card.dart';
import 'package:get/get.dart';

final Screen myFoodScreen = Screen(
    title: 'Food',
    contentBuilder: (BuildContext context) {
      return FoodScreen();
    });

class FoodScreen extends StatefulWidget {
  @override
  _FoodScreenState createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  final FoodController foodController = Get.find();

  TextEditingController nameTextEditingController = new TextEditingController();
  TextEditingController addressTextEditingController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: getScreenWidth(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: StreamBuilder(
                stream: foodController.getAllFood(),
                builder: (context, snapshot) {
                  if (snapshot.hasError || !snapshot.hasData)
                    return Center(
                      child: AppText(
                        text: 'No Food',
                      ),
                    );
                  return ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        Food food = snapshot.data[index];
                        return Container(
                          padding: EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              AppCard(
                                imageUrl: food.imageUrl,
                                name: food.name,
                                address: food.address,
                              ),
                            ],
                          ),
                        );
                      });
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'add food',
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
  }

  // void _addNoteModalBottomSheet(context) {
  //   showModalBottomSheet(
  //       isScrollControlled: true,
  //       context: context,
  //       builder: (BuildContext context) {
  //         return Obx((){
  //           return Padding(
  //             padding: EdgeInsets.only(
  //                 bottom: MediaQuery.of(context).viewInsets.bottom),
  //             child: SingleChildScrollView(
  //               child: Container(
  //                 child: Wrap(
  //                   children: <Widget>[
  //                     Container(
  //                       padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
  //                       child: Column(
  //                         children: <Widget>[
  //                           Row(
  //                             children: <Widget>[
  //                               Container(
  //                                 width: getScreenWidth(context) / 3,
  //                                 height: getScreenHeight(context) / 7,
  //                                 child: GestureDetector(
  //                                   child: foodController.image.value!=null?Container(decoration: new BoxDecoration(
  //                                     image: new DecorationImage(
  //                                       image: FileImage(File(foodController.image.value.path)),
  //                                       fit: BoxFit.cover,
  //                                     ),
  //                                   ),):Icon(
  //                                     Icons.add_a_photo_outlined,
  //                                     size: 80,
  //                                   ),
  //                                   onTap: () {
  //                                     foodController.choosePhotoFromLibrary();
  //                                     // showCupertinoModalPopup(
  //                                     //     context: context,
  //                                     //     builder: (context) =>
  //                                     //         _buildCupertinoActionSheetChangeAvatar());
  //                                   },
  //                                 ),
  //                               ),
  //                               Dimens.width20,
  //                               Expanded(
  //                                 child: Column(
  //                                   children: <Widget>[
  //                                     TextFormField(
  //                                       controller: nameTextEditingController,
  //                                       decoration: InputDecoration(
  //                                         icon: Icon(
  //                                           Icons.store,
  //                                         ),
  //                                         hintText: 'Enter name',
  //                                       ),
  //                                     ),
  //                                     TextFormField(
  //                                       controller: addressTextEditingController,
  //                                       decoration: InputDecoration(
  //                                         icon: Icon(Icons.add_location_outlined),
  //                                         hintText: 'Enter address',
  //                                       ),
  //                                     ),
  //                                     Padding(
  //                                       padding: EdgeInsets.only(top: 5),
  //                                       child: Center(
  //                                         child: AppText(
  //                                           text: foodController.msgErr.value,
  //                                           color: AppColors.red,
  //                                         ),
  //                                       ),
  //                                     ),
  //                                   ],
  //                                 ),
  //                               ),
  //                             ],
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                     Center(
  //                       child: Padding(
  //                         padding: EdgeInsets.only(bottom: 10),
  //                         child: Container(
  //                           child: AppButton(
  //                               FlutterLocalizations.of(context)
  //                                   .getString(context, 'confirm'), onTap: () {
  //                             if (nameTextEditingController.text.isBlank ||
  //                                 addressTextEditingController.text.isBlank)
  //                               foodController.msgErr.value = 'Can\'t be empty';
  //                             else if(foodController.image.value==null)
  //                               foodController.msgErr.value = 'Please choose a image';
  //                             else{
  //                               foodController.addFood(name: nameTextEditingController.text,address: addressTextEditingController.text);
  //                             }
  //                           }),
  //                         ),
  //                       ),
  //                     )
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           );
  //         });
  //       });
  // }
  //
  // Widget _buildCupertinoActionSheetChangeAvatar() {
  //   return CupertinoActionSheet(
  //     message: AppText(
  //         text: FlutterLocalizations.of(context)
  //             .getString(context, 'change_avatar')),
  //     actions: <Widget>[
  //       CupertinoActionSheetAction(
  //         child: AppText(
  //           text: FlutterLocalizations.of(context)
  //               .getString(context, 'choose_from_library'),
  //           color: AppColors.clickableText,
  //         ),
  //         onPressed: () async {
  //           await foodController.choosePhotoFromLibrary();
  //           Get.back();
  //         },
  //       ),
  //       CupertinoActionSheetAction(
  //         child: AppText(
  //           text: FlutterLocalizations.of(context)
  //               .getString(context, 'take_new_picture'),
  //           color: AppColors.clickableText,
  //         ),
  //         onPressed: () async {
  //           await foodController.takeNewPhoto();
  //           Get.back();
  //         },
  //       ),
  //     ],
  //   );
  // }
}
