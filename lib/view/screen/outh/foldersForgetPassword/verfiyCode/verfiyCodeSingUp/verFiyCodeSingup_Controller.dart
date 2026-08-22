import 'package:ecommerceapp21/core/class/statusReqoust.dart';
import 'package:ecommerceapp21/core/const/routes.dart';
import 'package:ecommerceapp21/core/function/handlingDataController.dart';
import 'package:ecommerceapp21/data/dataSource/remode/outh/verfiycodeSingup.dart';
import 'package:get/get.dart';

abstract class VerFiyCodeSingUpController extends GetxController {
  checkCode();
  gotopageSuccessSingUp(String verfiyCodeSingUp);
}

class VerFiyCodeSingUpControllerImp extends VerFiyCodeSingUpController {
  String? email;

  StatusReqoust? statusReqoust;
  VerfiyCodeSingUpData verfiyCodeSingUpData = VerfiyCodeSingUpData(Get.find());

  @override
  gotopageSuccessSingUp(String verfiyCodeSingUp) async {
    statusReqoust = StatusReqoust.loading;
    update();
    var respons = await verfiyCodeSingUpData.postData(email!, verfiyCodeSingUp);
    print(respons);
    statusReqoust = handlingData(respons);
    print("RESPONSE FROM SERVER: $respons");
    if (StatusReqoust.success == statusReqoust) {
      if (respons['status'] == 'success') {
        //  data.addAll(respons['data']);
        Get.toNamed(AppRoutes.successSingUp);
      } else {
        Get.defaultDialog(
            title: "Worning", middleText: "verfiy Code Not Correct");
        statusReqoust = StatusReqoust.failure;
      }
    }
    update();
  }

  @override
  checkCode() {
    Get.toNamed(AppRoutes.successSingUp);
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
