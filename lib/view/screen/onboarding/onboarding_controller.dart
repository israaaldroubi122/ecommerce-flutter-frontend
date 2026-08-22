import 'package:ecommerceapp21/core/const/routes.dart';
import 'package:ecommerceapp21/core/services/services.dart';
import 'package:ecommerceapp21/data/dataSource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OnBoareingController extends GetxController {
  next();
  onPageChenged(int index);
}

class OnBoareingControllerImp extends OnBoareingController {
  late PageController pagecontroller;
  int currentPage = 0;
  MyServices myServices = Get.find();

  @override
  next() {
    currentPage++;
    if (currentPage > onboardingList.length - 1) {
      myServices.sharedPreferences.setString("step", "1");
      Get.offAllNamed(AppRoutes.login);
    } else {
      pagecontroller.animateToPage(currentPage,
          duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChenged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pagecontroller = PageController();
    super.onInit();
  }
}
