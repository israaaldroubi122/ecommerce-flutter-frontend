import 'package:ecommerceapp21/core/class/statusReqoust.dart';
import 'package:ecommerceapp21/core/function/handlingDataController.dart';
import 'package:ecommerceapp21/core/services/services.dart';
import 'package:ecommerceapp21/data/dataSource/remode/favorite_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Favoritecontroller extends GetxController {
  List data = [];
  late StatusReqoust statusReqoust;

  MyServices myServices = Get.find();
  FavoriteData favoriteData = FavoriteData(Get.find());

  Map isfavorite = {};

  setfavorite(id, val) {
    isfavorite[id] = val;
    update();
  }

  addvaforite(String itemsid) async {
    data.clear();
    statusReqoust = StatusReqoust.loading;
    var respons = await favoriteData.addfavorite(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print("$respons");
    statusReqoust = handlingData(respons);
    if (StatusReqoust.success == statusReqoust) {
      if (respons['status'] == 'success') {
        Get.rawSnackbar(
            title: "اشعار", messageText: const Text(" تم اضافة المنتج"));
        // data.addAll(respons['data']);
      } else {
        statusReqoust = StatusReqoust.failure;
      }
    }
  }

  removefavorite(String itemsid) async {
    data.clear();
    statusReqoust = StatusReqoust.loading;
    var respons = await favoriteData.removefavorite(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print("$respons");
    statusReqoust = handlingData(respons);
    if (StatusReqoust.success == statusReqoust) {
      if (respons['status'] == 'success') {
        Get.rawSnackbar(
            title: "اشعار", messageText: const Text("تم حذف المنتج"));
        //  data.addAll(respons['data']);
      } else {
        statusReqoust = StatusReqoust.failure;
      }
    }
  }
}
