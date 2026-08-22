import 'package:ecommerceapp21/core/class/statusReqoust.dart';
import 'package:ecommerceapp21/core/function/handlingDataController.dart';
import 'package:ecommerceapp21/core/services/services.dart';
import 'package:ecommerceapp21/data/dataSource/remode/outh/orders/detail_data.dart';
import 'package:ecommerceapp21/data/model/cartModel.dart';
import 'package:ecommerceapp21/data/model/ordersModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class OrderDetailsController extends GetxController {
  late OrdersModel ordersModel;

  StatusReqoust? statusReqoust;
  MyServices myServices = Get.find();
  DetailsData detailsData = DetailsData(Get.find());
  List<CartModel> data = [];

  var markers = <Marker>[].obs;

  double? lat;
  double? long;

  addMarker(LatLng latlng) {
    markers.clear();
    markers.add(
      Marker(
        point: latlng,
        width: 60,
        height: 60,
        child: Icon(
          Icons.location_on,
          color: Colors.red,
          size: 40,
        ),
      ),
    );
    lat = latlng.latitude;
    long = latlng.latitude;
    update();
  }

  List<Marker> get markerList => markers.toList();

  getdataOrdersDetails() async {
    statusReqoust = StatusReqoust.loading;
    update();
    var respons = await detailsData.getData(ordersModel.ordersId!);
    print(respons);
    statusReqoust = handlingData(respons);
    print("استجابة السيرفر: $respons");
    if (StatusReqoust.success == statusReqoust) {
      if (respons['status'] == 'success') {
        //  data.addAll(respons['data']);
        List listdata = respons['data'];
        data.addAll(listdata.map((e) => CartModel.fromJson(e)));
      } else {
        statusReqoust = StatusReqoust.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    ordersModel = Get.arguments['OrdersModel'];
    getdataOrdersDetails();
    super.onInit();
  }
}
