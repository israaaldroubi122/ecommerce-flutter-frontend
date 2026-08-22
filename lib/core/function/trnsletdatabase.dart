import 'package:ecommerceapp21/core/services/services.dart';
import 'package:get/get.dart';

trnsleteDataBase(columnar, columnen) {
  MyServices myServices = Get.find();

  if (myServices.sharedPreferences.getString("lang") == "ar") {
    return columnar;
  } else {
    return columnen;
  }
}
