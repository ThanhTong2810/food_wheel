import 'package:food_wheel/model/food_model.dart';
import 'package:get/get.dart';

class WheelController extends GetxController{
  Rx<int> selected =Rx<int>(0);
  RxList<dynamic> items=RxList.from([]);
  Rx<bool> isFood=Rx<bool>(false);
  Rx<bool> listEmpty=Rx<bool>(true);
}