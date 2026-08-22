import 'package:ecommerceapp21/core/services/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class ChangLocalController extends GetxController {}

class ChangLocalControllerImp extends ChangLocalController {
  Locale? language;
  MyServices myServices = Get.find();

  changeLanguge(String langCode) {
    Locale locale = Locale(langCode);
    myServices.sharedPreferences.setString('lang', langCode);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharedPreferLang = myServices.sharedPreferences.getString("lang");
    if (sharedPreferLang == "ar") {
      language = const Locale("ar");
    } else if (sharedPreferLang == "en") {
      language = const Locale("en");
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}
