import 'package:ecommerceapp21/core/class/statusReqoust.dart';
import 'package:ecommerceapp21/core/function/handlingDataController.dart';
import 'package:ecommerceapp21/data/dataSource/remode/testdata.dart';
import 'package:get/get.dart';

class Testcontroller extends GetxController {
  TestData testData = TestData(Get.find());
  List data = [];

  late StatusReqoust statusReqoust;

  getdata() async {
    statusReqoust = StatusReqoust.loading;
    var response = await testData.getData();
    print(response);
    statusReqoust = handlingData(response);
    if (StatusReqoust.success == statusReqoust) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusReqoust = StatusReqoust.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getdata();
    super.onInit();
  }
}
