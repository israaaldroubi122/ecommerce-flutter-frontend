import 'package:ecommerceapp21/core/class/statusReqoust.dart';
import 'package:ecommerceapp21/core/const/routes.dart';
import 'package:ecommerceapp21/core/function/handlingDataController.dart';
import 'package:ecommerceapp21/data/dataSource/remode/forgetpassword/resetpassword.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPassWordController extends GetxController {
  resetPassword();
  gotopageSuccessResetPassWord();
}

class ResetPassWordControllerImp extends ResetPassWordController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController password;
  late TextEditingController repassword;

  StatusReqoust? statusReqoust;
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  String? email;

  @override
  gotopageSuccessResetPassWord() async {
    if (password.text != repassword.text) {
      return Get.defaultDialog(
          title: "Warning", middleText: "Password not match");
    }

    if (formState.currentState!.validate()) {
      statusReqoust = StatusReqoust.loading;
      update();
      var respons = await resetPasswordData.postData(
        email!,
        password.text,
      );
      print(respons);
      statusReqoust = handlingData(respons);
      print("استجابة السيرفر: $respons");
      if (StatusReqoust.success == statusReqoust) {
        if (respons['status'] == 'success') {
          //  data.addAll(respons['data']);
          Get.offNamed(AppRoutes.successResetPassword);
        } else {
          Get.defaultDialog(title: "Worning", middleText: "Try again");
          statusReqoust = StatusReqoust.failure;
        }
      }
      update();
    } else {}
  }

  @override
  void onInit() {
    email = Get.arguments["email"];
    password = TextEditingController();
    repassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();
    super.dispose();
  }

  @override
  resetPassword() {}
}
