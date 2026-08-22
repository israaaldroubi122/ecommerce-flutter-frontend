import 'package:ecommerceapp21/core/class/statusReqoust.dart';
import 'package:ecommerceapp21/core/const/routes.dart';
import 'package:ecommerceapp21/core/function/handlingDataController.dart';
import 'package:ecommerceapp21/core/services/services.dart';
import 'package:ecommerceapp21/data/dataSource/remode/address_data.dart';
import 'package:ecommerceapp21/data/dataSource/remode/checkOut_data.dart';
import 'package:ecommerceapp21/data/model/addressModel.dart';
import 'package:get/get.dart';

class CheckOutController extends GetxController {
  AddressData addressdata = Get.put(AddressData(Get.find()));

  CheckOutData checkOutData = Get.put(CheckOutData(Get.find()));

  MyServices myServices = Get.find();

  StatusReqoust? statusReqoust;

  String? paymenyMethod;
  String? delivaryType;
  String? addressId;

  late String couponId;
  late String priceOrder;
  late String coupondiscount;

  List<AddressModel> dataaddress = [];

  choosepaymenyMethod(String val) {
    paymenyMethod = val;
    update();
  }

  choosedelivaryType(String val) {
    delivaryType = val;
    update();
  }

  chooseaddressId(String val) {
    addressId = val;
    update();
  }

  getsheppingAddress() async {
    statusReqoust = StatusReqoust.loading;
    var response = await addressdata
        .getData(myServices.sharedPreferences.getString("id")!);
    print(response);
    statusReqoust = handlingData(response);
    if (StatusReqoust.success == statusReqoust) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        dataaddress.addAll(listdata.map((e) => AddressModel.fromJson(e)));
      } else {
        statusReqoust = StatusReqoust.failure;
      }
    }
    update();
  }

  checkOut() async {
    if (paymenyMethod == null) {
      return Get.snackbar("Error", "pleas Enter paymeny Method");
    }
    if (delivaryType == null) {
      return Get.snackbar("Error", "pleas Enter delivary Type");
    }

    if (dataaddress.isEmpty) {
      return Get.snackbar("Error", "pleas Selected Shepping Address");
    }
    statusReqoust = StatusReqoust.loading;

    Map data = {
      "usersid": myServices.sharedPreferences.getString("id"),
      "addressid": addressId.toString(),
      "orderstype": delivaryType.toString(),
      "pricedelivery": "10",
      "ordersprice": priceOrder.toString(),
      "couponid": couponId.toString(),
      "coupondiscount": coupondiscount.toString(),
      "paymentmothod": paymenyMethod.toString(),
    };
    var response = await checkOutData.checkOut(data);
    print(response);
    statusReqoust = handlingData(response);
    if (StatusReqoust.success == statusReqoust) {
      if (response['status'] == "success") {
        print("success");
        Get.offAllNamed(AppRoutes.homePage);
        Get.snackbar("sussess", "the order was successful");
      } else {
        statusReqoust = StatusReqoust.failure;
        // Get.snackbar("error", "pleas try agen");
      }
    }
    update();
  }

  @override
  void onInit() {
    couponId = Get.arguments['couponid'];
    priceOrder = Get.arguments['priceOrder'];
    coupondiscount = Get.arguments['coupondiscount'].toString();
    getsheppingAddress();
    super.onInit();
  }
}
