import 'package:ecommerceapp21/core/class/statusReqoust.dart';
import 'package:ecommerceapp21/core/const/routes.dart';
import 'package:ecommerceapp21/core/function/handlingDataController.dart';
import 'package:ecommerceapp21/core/services/services.dart';
import 'package:ecommerceapp21/data/dataSource/remode/cart_data.dart';

import 'package:ecommerceapp21/data/model/cartModel.dart';
import 'package:ecommerceapp21/data/model/couponModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  TextEditingController? controllerCoupon;

  CartData cartData = CartData(Get.find());

  late StatusReqoust statusReqoust;

  MyServices myServices = Get.find();

  List<CartModel> data = [];

  double priceOrder = 0.0;

  int totalcountItems = 0;

  int? discountCoupon = 0;

  String? couponName;
  String? couponId;

  CouponModel? couponModel;

  addcart(String itemsid) async {
    statusReqoust = StatusReqoust.loading;
    update();
    var respons = await cartData.addcart(
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
    update();
  }

  getTotalPrice() {
    return (priceOrder - priceOrder * discountCoupon! / 100);
  }

  removecart(String itemsid) async {
    statusReqoust = StatusReqoust.loading;
    update();
    var respons = await cartData.rmovecart(
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
    update();
  }

  getCountItems(String itemsid) async {
    statusReqoust = StatusReqoust.loading;
    var respons = await cartData.getcountitems(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print("$respons");
    statusReqoust = handlingData(respons);
    if (StatusReqoust.success == statusReqoust) {
      if (respons['status'] == 'success') {
        int countItems = 0;
        countItems = int.parse(respons['data']);
        print("==================");
        print('$countItems');
        print('$priceOrder');
        return countItems;
        //  data.addAll(respons['data']);
      } else {
        statusReqoust = StatusReqoust.failure;
      }
    }
  }

  cartView() async {
    statusReqoust = StatusReqoust.loading;
    update();
    data.clear();
    var respons = await cartData.cartView(
      myServices.sharedPreferences.getString("id")!,
    );
    print("================================$respons");
    statusReqoust = handlingData(respons);
    if (StatusReqoust.success == statusReqoust) {
      if (respons['status'] == 'success') {
        List dataresponse = respons['datacart']['data'];
        Map dataResponseCountPrice = respons['countprice'];
        data.clear();
        data.addAll(dataresponse.map((e) => CartModel.fromJson(e)));
        totalcountItems = int.parse(dataResponseCountPrice['totelcount']);
        priceOrder = double.parse(dataResponseCountPrice['totelprice']);
        print(priceOrder);
        update();
        //  data.addAll(respons['data']);
      } else {
        statusReqoust = StatusReqoust.failure;
      }
    }
  }

  checkCoupon() async {
    statusReqoust = StatusReqoust.loading;
    update();
    var respons = await cartData.checkCoupon(controllerCoupon!.text);
    print("$respons");
    statusReqoust = handlingData(respons);
    if (StatusReqoust.success == statusReqoust) {
      if (respons['status'] == 'success') {
        //  Map<String, dynamic> dataCoupon = respons['data'];
        Map<String, dynamic> dataCoupon =
            Map<String, dynamic>.from(respons['coupon']);
        couponModel = CouponModel.fromJson(dataCoupon);
        discountCoupon = int.parse(couponModel!.couponDiscount!);
        couponName = couponModel!.couponName;
        couponId = couponModel!.couponId;
      } else {
        // statusReqoust = StatusReqoust.failure;
        discountCoupon = 0;
        couponName = null;
        couponId = null;
        Get.snackbar("Warning", "Coupon Not Valied");
      }
    }
    update();
  }

  resetvarcart() {
    totalcountItems = 0;
    priceOrder = 0.0;
    data.clear();
  }

  refreshPage() {
    resetvarcart();
    cartView();
  }

  @override
  void onInit() {
    controllerCoupon = TextEditingController();
    refreshPage();
    cartView();
    super.onInit();
  }

  gotopagecheckOut() {
    if (data.isEmpty) return Get.snackbar("worning", "null");
    Get.toNamed(AppRoutes.checkout, arguments: {
      "couponid": couponId ?? "0",
      "priceOrder": priceOrder.toString(),
      "coupondiscount": discountCoupon.toString(),
    });
  }
}
