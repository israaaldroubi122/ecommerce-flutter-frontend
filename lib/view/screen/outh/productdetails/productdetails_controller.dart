import 'package:ecommerceapp21/core/class/statusReqoust.dart';
import 'package:ecommerceapp21/data/model/itemsModel.dart';
import 'package:ecommerceapp21/view/screen/outh/cart/cart_controller.dart';
import 'package:get/get.dart';

abstract class Productdetailscontroller extends GetxController {
  intialData();
}

class ProductdetailscontrollerImp extends Productdetailscontroller {
  CartController cartController = Get.put(CartController());
  late Itemsmodel itemsmodel;
  late StatusReqoust statusReqoust;
  int countitems = 0;
  @override
  intialData() async {
    statusReqoust = StatusReqoust.loading;
    itemsmodel = Get.arguments["itemsmodel"];
    countitems = await cartController.getCountItems(itemsmodel.itemsId!);
    statusReqoust = StatusReqoust.success;
    update();
  }

  List subitems = [
    {"name": "red", "id": 1, "active": "0"},
    {"name": "bleu", "id": 2, "active": "1"},
    {"name": "black", "id": 3, "active": "1"},
  ];

  add() {
    cartController.addcart(itemsmodel.itemsId!);
    countitems++;
    update();
  }

  remove() {
    if (countitems > 0) {
      cartController.removecart(itemsmodel.itemsId!);
      countitems--;
      update();
    }
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
