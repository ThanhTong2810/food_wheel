import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:food_wheel/constants/constants.dart';
import 'package:food_wheel/helper/firebase_helper.dart';
import 'package:food_wheel/model/food_model.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class FoodController extends GetxController {
  Rx<bool> isShowLoading = Rx<bool>(false);
  Rx<PickedFile> image = Rx<PickedFile>(null);
  Rx<String> msgErr = Rx<String>('');
  ImagePicker imagePicker = ImagePicker();

  Stream<List<Food>> getAllFood() {
    return FirebaseHelper.fireStoreReference
        .collection(Constants.FOODS)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Food.fromJson(doc.data())).toList());
  }

  // addFood({String name, String address}) async {
  //   isShowLoading.value = true;
  //   String foodId;
  //
  //   String url = await uploadImage();
  //   await FirebaseHelper.fireStoreReference
  //       .collection(Constants.FOODS)
  //       .add({'imageUrl': url}).then((value) => foodId = value.id);
  //
  //   var foodData = {
  //     'name': name ?? '',
  //     'address': address ?? '',
  //     'id': foodId,
  //   };
  //
  //   await FirebaseHelper.fireStoreReference
  //       .collection(Constants.FOODS)
  //       .doc(foodId)
  //       .update(foodData);
  //
  //   isShowLoading.value = false;
  // }
  //
  // Future choosePhotoFromLibrary() async {
  //   var imagePicked = await imagePicker.getImage(
  //       source: ImageSource.gallery, maxHeight: 400, maxWidth: 400);
  //   if (imagePicked != null) {
  //     image.value = imagePicked;
  //   }
  // }
  //
  // Future takeNewPhoto() async {
  //   var imagePicked = await imagePicker.getImage(
  //       source: ImageSource.camera, maxHeight: 400, maxWidth: 400);
  //   if (imagePicked != null) {
  //     image.value = imagePicked;
  //   }
  // }
  //
  // Future uploadImage() async {
  //   String fileName = basename(image.value.path);
  //   StorageReference firebaseStorageRef =
  //       FirebaseStorage.instance.ref().child('foods/$fileName');
  //   FirebaseHelper.uploadTask =
  //       firebaseStorageRef.putFile(File(image.value.path));
  //   FirebaseHelper.storageTaskSnapshot =
  //       await FirebaseHelper.uploadTask.onComplete;
  //
  //   var urlImage =
  //       await FirebaseHelper.storageTaskSnapshot.ref.getDownloadURL();
  //
  //   return urlImage;
  // }

  getFood() async {
    QuerySnapshot snapshot = await FirebaseHelper.fireStoreReference
        .collection(Constants.FOODS)
        .get();
    return RxList<Food>(
        snapshot.docs.map((e) => Food.fromJson(e.data())).toList());
  }
}
