import 'package:ecommerceapp21/core/class/statusReqoust.dart';
import 'package:ecommerceapp21/core/function/handlingDataController.dart';
import 'package:ecommerceapp21/core/services/services.dart';
import 'package:ecommerceapp21/data/dataSource/remode/items_data.dart';
import 'package:ecommerceapp21/data/model/itemsModel.dart';
import 'package:ecommerceapp21/view/screen/outh/HomePage/homepage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ItemsController extends GetxController {
  initalData();
  changCat(int val, String catval);
  getItems(String categoriesid);
  gotopageProductdetails(Itemsmodel itemsmodel);
}

class ItemsControllerImp extends SearchMexController {
  String delivaryTime = "";
  List categories = [];
  int? selectedCat;
  String? catid;

  ItemsData itemsData = ItemsData(Get.find());

  late StatusReqoust statusReqoust;

  List data = [];
  MyServices myServices = Get.find();

  initalData() {
    delivaryTime = myServices.sharedPreferences.getString("delivaryTime")!;
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedCat'];
    catid = Get.arguments['catid'];
    getItems(catid!);
  }

  @override
  void onInit() {
    search = TextEditingController();
    initalData();
    super.onInit();
  }

  changCat(val, catval) {
    selectedCat = val;
    catid = catval;
    getItems(catid!);
    update();
  }

  getItems(categoriesid) async {
    data.clear();
    statusReqoust = StatusReqoust.loading;
    var respons = await itemsData.getdata(
        categoriesid, myServices.sharedPreferences.getString("id")!);
    print("$respons");
    statusReqoust = handlingData(respons);
    if (StatusReqoust.success == statusReqoust) {
      if (respons['status'] == 'success') {
        data.addAll(respons['data']);
      } else {
        statusReqoust = StatusReqoust.failure;
      }
    }
    update();
  }

  gotopageProductdetails(itemsmodel) {
    Get.toNamed("productdetails", arguments: {"itemsmodel": itemsmodel});
  }
}
