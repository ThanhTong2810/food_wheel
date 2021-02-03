import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_wheel/constants/constants.dart';
import 'package:food_wheel/helper/firebase_helper.dart';
import 'package:food_wheel/model/drink_model.dart';
import 'package:get/get.dart';

class DrinkController extends GetxController{
  Rx<bool> isShowLoading = Rx<bool>(false);
  RxList<Drink> listDrink=RxList<Drink>([]);

  getDrink() async {
    QuerySnapshot snapshot = await FirebaseHelper.fireStoreReference
        .collection(Constants.DRINKS)
        .get();
    return RxList<Drink>(
        snapshot.docs.map((e) => Drink.fromJson(e.data())).toList());
  }
}