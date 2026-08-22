import 'package:ecommerceapp21/core/class/statusReqoust.dart';
import 'package:ecommerceapp21/core/const/routes.dart';
import 'package:ecommerceapp21/core/function/handlingDataController.dart';
import 'package:ecommerceapp21/core/services/services.dart';
import 'package:ecommerceapp21/data/dataSource/remode/outh/logIn.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  gotoPageSingUp();
  gotoPageForgetPassWord();

  login();
}

class LoginControllerImp extends LoginController {
  bool isShowPassword = true;
  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  MyServices myServices = Get.find();
  StatusReqoust? statusReqoust;
  LogInData logindata = LogInData(Get.find());

  @override
  login() async {
    if (formState.currentState!.validate()) {
      statusReqoust = StatusReqoust.loading;
      update();
      var respons = await logindata.postData(
        password.text,
        email.text,
      );
      print(respons);
      statusReqoust = handlingData(respons);
      print("استجابة السيرفر: $respons");
      if (StatusReqoust.success == statusReqoust) {
        if (respons['status'] == 'success') {
          //  data.addAll(respons['data']);
          myServices.sharedPreferences
              .setString("id", respons['data']['users_id']);
          myServices.sharedPreferences
              .setString("username", respons['data']['users_name']);
          myServices.sharedPreferences
              .setString("email", respons['data']['users_email']);
          myServices.sharedPreferences
              .setString("phone", respons['data']['users_phone']);
          myServices.sharedPreferences.setString("step", "2");

          Get.offNamed(AppRoutes.homePage, arguments: {"email": email.text});
        } else {
          Get.defaultDialog(
              title: "Worning",
              middleText: "Phone password OR Email not correct");
          statusReqoust = StatusReqoust.failure;
        }
      }
      update();
    } else {}
  }

  @override
  void onInit() {
    // FirebaseMessaging.instance.getToken().then((value) {
    // print(value);
    //String? token = value;
    //});
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  gotoPageSingUp() {
    Get.offNamed(AppRoutes.sinUp);
  }

  @override
  gotoPageForgetPassWord() {
    Get.toNamed(AppRoutes.forgetPassword);
  }
}
