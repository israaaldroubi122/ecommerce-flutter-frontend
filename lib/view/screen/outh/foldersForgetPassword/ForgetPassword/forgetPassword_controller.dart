import 'package:ecommerceapp21/core/class/statusReqoust.dart';
import 'package:ecommerceapp21/core/const/routes.dart';
import 'package:ecommerceapp21/core/function/handlingDataController.dart';
import 'package:ecommerceapp21/data/dataSource/remode/forgetpassword/checkemail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  checkEmail();
  // gotopageverfiyCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController email;

  CheckEmailData checkEmailData = CheckEmailData(Get.find());
  StatusReqoust? statusReqoust;

  @override
  checkEmail() async {
    if (formState.currentState!.validate()) {
      statusReqoust = StatusReqoust.loading;
      update();
      var respons = await checkEmailData.postData(email.text);
      print(respons);
      statusReqoust = handlingData(respons);
      print("استجابة السيرفر: $respons");
      if (StatusReqoust.success == statusReqoust) {
        if (respons['status'] == 'success') {
          Get.offAllNamed(AppRoutes.verfiyCode,
              arguments: {"email": email.text});
        } else {
          Get.defaultDialog(title: "Worning", middleText: "Email not Find");
          statusReqoust = StatusReqoust.failure;
        }
      }
      update();
    }
  }

  /* @override
  gotopageverfiyCode() {
    var formdata = formState.currentState;
    if (formdata!.validate()) {
      return Get.toNamed(AppRoutes.verfiyCode);
    } else {
      print("Not Valid");
    }
  }*/

  @override
  void onInit() {
    email = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();

    super.dispose();
  }
}
