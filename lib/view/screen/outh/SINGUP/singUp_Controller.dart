import 'package:ecommerceapp21/core/class/statusReqoust.dart';
import 'package:ecommerceapp21/core/const/routes.dart';
import 'package:ecommerceapp21/core/function/handlingDataController.dart';
import 'package:ecommerceapp21/data/dataSource/remode/outh/singup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SingUpController extends GetxController {
  gotopageLogIn();
  // gotopageCheckEmail();
  singUp();
}

class SingUpControllerImp extends SingUpController {
  bool isShowPassword = true;

  showPassword() {
    isShowPassword = !isShowPassword;
    update(); // حتى يتحدث الـ UI
  }

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController username;
  late TextEditingController phone;

  StatusReqoust? statusReqoust;

  SingUpData singUpData = SingUpData(Get.find());
  List data = [];

  @override
  singUp() async {
    if (formState.currentState!.validate()) {
      statusReqoust = StatusReqoust.loading;
      update();
      var respons = await singUpData.postData(
        username.text,
        password.text,
        email.text,
        phone.text,
      );
      print(respons);
      statusReqoust = handlingData(respons);
      print("استجابة السيرفر: $respons");
      if (StatusReqoust.success == statusReqoust) {
        if (respons['status'] == 'success') {
          //  data.addAll(respons['data']);
          Get.offNamed(AppRoutes.verfiyCodeSingUp,
              arguments: {"email": email.text});
        } else {
          Get.defaultDialog(
              title: "Worning",
              middleText: "Phone Number OR Email alrady exist");
          statusReqoust = StatusReqoust.failure;
        }
      }
      update();
    } else {}
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    username = TextEditingController();
    phone = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    username.dispose();
    phone.dispose();
    super.dispose();
  }

  @override
  gotopageLogIn() {
    Get.toNamed(AppRoutes.login);
  }
}
//  @override
  //gotopageCheckEmail() {
  //var formdata = formState.currentState;
  //if (formdata!.validate()) {
  ///Get.offNamed(AppRoutes.verfiyCodeSingUp);
  //} else {
  //print("not valid");
  //}
  //}

