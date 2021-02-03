import 'package:food_wheel/model/food_model.dart';
import 'package:get/get.dart';

class WheelController extends GetxController{
  Rx<int> selected =Rx<int>(0);
  RxList<dynamic> items=RxList<dynamic>([]);
}