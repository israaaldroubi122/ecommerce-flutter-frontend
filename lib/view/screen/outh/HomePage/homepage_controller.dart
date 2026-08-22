import 'package:ecommerceapp21/core/class/statusReqoust.dart';
import 'package:ecommerceapp21/core/const/routes.dart';
import 'package:ecommerceapp21/core/function/handlingDataController.dart';
import 'package:ecommerceapp21/core/services/services.dart';
import 'package:ecommerceapp21/data/dataSource/remode/home_data.dart';
import 'package:ecommerceapp21/data/model/itemsModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomePageController extends SearchMexController {
  initialData();
  getData();
  gotopageProductdetails(Itemsmodel itemsmodel);
  gotoItem(List categories, int selectedCat, String categoriesid);
}

class HomePageControllerImp extends HomePageController {
  List<Itemsmodel> listdata = [];

  MyServices myServices = Get.find();
  String? username;
  String? id;

  String titelHomeCard = "";
  String bodyHomeCard = "";
  String delivaryTime = "";

  Homedata homedata = Homedata(Get.find());
  late StatusReqoust statusReqoust;
  //List data = [];
  List categories = [];
  List items = [];
  List settingdata = [];

  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");
  }

  @override
  void onInit() {
    search = TextEditingController();
    getData();
    initialData();
    super.onInit();
  }

  @override
  getData() async {
    statusReqoust = StatusReqoust.loading;
    var respons = await homedata.getdata();
    print("$respons");
    statusReqoust = handlingData(respons);
    if (StatusReqoust.success == statusReqoust) {
      if (respons['status'] == 'success') {
        categories.addAll(respons['categories']['data']);
        items.addAll(respons['items']['data']);
        settingdata.addAll(respons['settings']['data']);
        titelHomeCard = settingdata[0]['setting_titelhome'];
        bodyHomeCard = settingdata[0]['settingbodyhome'];
        delivaryTime = settingdata[0]['settings_deliverytime'];
        myServices.sharedPreferences.setString("delivaryTime", delivaryTime);
      } else {
        statusReqoust = StatusReqoust.failure;
      }
    }
    update();
  }

  @override
  gotoItem(categories, selectedCat, categoriesid) {
    Get.toNamed(AppRoutes.items, arguments: {
      "categories": categories,
      "selectedCat": selectedCat,
      "catid": categoriesid
    });
  }

  @override
  gotopageProductdetails(itemsmodel) {
    Get.toNamed("productdetails", arguments: {"itemsmodel": itemsmodel});
  }
}

class SearchMexController extends GetxController {
  Homedata homedata = Homedata(Get.find());
  List<Itemsmodel> listdata = [];
  MyServices myServices = Get.find();
  late StatusReqoust statusReqoust;
  TextEditingController? search;
  bool issearch = false;
  checkSearch(val) {
    if (val == "") {
      issearch = false;
    }
    update();
  }

  onsearchitems() {
    issearch = true;
    searchdata();
    update();
  }

  searchdata() async {
    statusReqoust = StatusReqoust.loading;
    var respons = await homedata.searchdata(search!.text);
    print("$respons");
    statusReqoust = handlingData(respons);
    if (StatusReqoust.success == statusReqoust) {
      if (respons['status'] == 'success') {
        listdata.clear();
        List responsdata = respons['data'];
        listdata.addAll(responsdata.map((e) => Itemsmodel.fromJson(e)));
      } else {
        statusReqoust = StatusReqoust.failure;
      }
    }
    update();
  }
}
