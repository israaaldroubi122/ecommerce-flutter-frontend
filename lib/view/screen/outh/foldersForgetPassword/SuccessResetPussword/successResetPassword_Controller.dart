import 'package:ecommerceapp21/core/const/routes.dart';
import 'package:get/get.dart';

abstract class SuccessResetPassWordController extends GetxController {
  gotoPageLogIn();
}

class SuccessResetPassWordControllerImp extends SuccessResetPassWordController {
  @override
  gotoPageLogIn() {
    Get.offAllNamed(AppRoutes.login);
  }
}
