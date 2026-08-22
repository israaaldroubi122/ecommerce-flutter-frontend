import 'package:ecommerceapp21/core/class/statusReqoust.dart';
import 'package:ecommerceapp21/core/const/routes.dart';
import 'package:ecommerceapp21/core/function/handlingDataController.dart';
import 'package:ecommerceapp21/data/dataSource/remode/forgetpassword/verifycode.dart';
import 'package:get/get.dart';

abstract class VerFiyCodeController extends GetxController {
  checkCode();
  gotopageResetPassword(String verfiyCode);
}

class VerFiyCodeControllerImp extends VerFiyCodeController {
  // late String verfiyCode;

  StatusReqoust? statusReqoust;
  String? email;
  VerfiyCodeforgetpasswordData verfiyCodeforgetpasswordData =
      VerfiyCodeforgetpasswordData(Get.find());

  @override
  gotopageResetPassword(verfiyCode) async {
    statusReqoust = StatusReqoust.loading;
    update();
    var respons =
        await verfiyCodeforgetpasswordData.postData(email!, verfiyCode);
    statusReqoust = handlingData(respons);
    print("استجابة السيرفر: $respons");
    if (StatusReqoust.success == statusReqoust) {
      if (respons['status'] == 'success') {
        Get.offNamed(AppRoutes.resetpassword, arguments: {"email": email});
      } else {
        Get.defaultDialog(
            title: "Worning", middleText: "Verify code not correct");
        statusReqoust = StatusReqoust.failure;
      }
    }
    update();
  }

  @override
  checkCode() {
    //Get.toNamed(AppRoutes.verfiyCode);
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
