import 'package:ecommerceapp21/core/class/statusReqoust.dart';
import 'package:ecommerceapp21/core/const/routes.dart';

import 'package:ecommerceapp21/core/function/handlingDataController.dart';
import 'package:ecommerceapp21/core/services/services.dart';
import 'package:ecommerceapp21/data/dataSource/remode/address_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddDetailseAddresscontroller extends GetxController {
  TextEditingController? name;
  TextEditingController? street;
  TextEditingController? city;

  StatusReqoust? statusReqoust;

  AddressData addressdata = AddressData(Get.find());
  MyServices myServices = Get.find();
  List data = [];

  String? lat;
  String? long;

  inialDtat() {
    name = TextEditingController();
    street = TextEditingController();
    city = TextEditingController();

    lat = Get.arguments['lat'];
    long = Get.arguments['long'];

    print("lat=========================$lat");
    print("lang========================$long");
  }

  addadrress() async {
    statusReqoust = StatusReqoust.loading;
    update();
    var respons = await addressdata.addData(
        myServices.sharedPreferences.getString("id")!,
        name!.text,
        city!.text,
        street!.text,
        lat!,
        long!);
    print(" ===============controller: $respons");
    statusReqoust = handlingData(respons);
    print("استجابة السيرفر: $respons");
    if (StatusReqoust.success == statusReqoust) {
      if (respons['status'] == 'success') {
        //  data.addAll(respons['data']);
        Get.toNamed(AppRoutes.homePage);
      } else {
        statusReqoust = StatusReqoust.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    inialDtat();
    // addadrress();
    super.onInit();
  }
}
