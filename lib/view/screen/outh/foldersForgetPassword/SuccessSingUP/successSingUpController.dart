import 'package:ecommerceapp21/core/const/routes.dart';
import 'package:get/get.dart';

abstract class SuccessSingUpController extends GetxController {
  gotoPageLogIn();
}

class SuccessSingUpControllerImp extends SuccessSingUpController {
  @override
  gotoPageLogIn() {
    Get.offAllNamed(AppRoutes.login);
  }
}
