import 'package:ecommerceapp21/core/class/statusReqoust.dart';
import 'package:ecommerceapp21/core/function/handlingDataController.dart';
import 'package:ecommerceapp21/core/services/services.dart';
import 'package:ecommerceapp21/data/dataSource/remode/outh/offers_data.dart';

import 'package:ecommerceapp21/data/model/itemsModel.dart';
import 'package:ecommerceapp21/view/screen/outh/HomePage/homepage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffersController extends SearchMexController {
  late StatusReqoust statusReqoust;

  MyServices myServices = Get.find();

  OffersData offersData = OffersData(Get.find());

  List<Itemsmodel> data = [];

  getOffers() async {
    statusReqoust = StatusReqoust.loading;
    update();
    var respons = await offersData.getData();
    print(respons);
    statusReqoust = handlingData(respons);
    print("استجابة السيرفر: $respons");
    if (StatusReqoust.success == statusReqoust) {
      if (respons['status'] == 'success') {
        List listdata2 = respons['data'];
        data.addAll(listdata2.map((e) => Itemsmodel.fromJson(e)));
      } else {
        statusReqoust = StatusReqoust.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    search = TextEditingController();
    getOffers();
    super.onInit();
  }
}
