import 'package:ecommerceapp21/core/class/statusReqoust.dart';
import 'package:ecommerceapp21/core/function/handlingDataController.dart';
import 'package:ecommerceapp21/core/services/services.dart';
import 'package:ecommerceapp21/data/dataSource/remode/outh/orders/pending_data.dart';
import 'package:ecommerceapp21/data/model/ordersModel.dart';
import 'package:get/get.dart';

class PendingOrderController extends GetxController {
  StatusReqoust? statusReqoust;
  MyServices myServices = Get.find();
  PendingData pendingData = PendingData(Get.find());
  List<OrdersModel> data = [];

  String printTypeOrder(String val) {
    if (val == "0") {
      return "delivery";
    } else {
      return "Recive";
    }
  }

  String printPaymentMethod(String val) {
    if (val == "0") {
      return "Cach On Delivary";
    } else {
      return "card";
    }
  }

  String prentOrderStatus(String val) {
    if (val == "0") {
      return "Pending Approval";
    } else if (val == "1") {
      return "The Order is  being Prepared";
    } else if (val == "2") {
      return "Ready To Picked Up By Delivery man";
    } else if (val == "3") {
      return "On The Way";
    } else {
      return "Archive";
    }
  }

  getOrders() async {
    statusReqoust = StatusReqoust.loading;
    update();
    var respons = await pendingData
        .getData(myServices.sharedPreferences.getString("id")!);
    print(respons);
    statusReqoust = handlingData(respons);
    print("استجابة السيرفر: $respons");
    if (StatusReqoust.success == statusReqoust) {
      if (respons['status'] == 'success') {
        //  data.addAll(respons['data']);
        List listdata = respons['data'];
        data.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusReqoust = StatusReqoust.failure;
      }
    }
    update();
  }

  deletOrder(String orderid) async {
    statusReqoust = StatusReqoust.loading;
    update();
    var respons = await pendingData.deletData(orderid);
    print(respons);
    statusReqoust = handlingData(respons);
    print("استجابة السيرفر: $respons");
    if (StatusReqoust.success == statusReqoust) {
      if (respons['status'] == 'success') {
      } else {
        statusReqoust = StatusReqoust.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}
