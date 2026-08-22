import 'package:ecommerceapp21/core/class/statusReqoust.dart';
import 'package:ecommerceapp21/core/function/handlingDataController.dart';
import 'package:ecommerceapp21/core/services/services.dart';
import 'package:ecommerceapp21/data/dataSource/remode/address_data.dart';
import 'package:ecommerceapp21/data/model/addressModel.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  AddressData addressData = AddressData(Get.find());

  MyServices myServices = Get.find();

  List<AddressModel> data = [];

  late StatusReqoust statusReqoust;

  getdata() async {
    statusReqoust = StatusReqoust.loading;
    update();
    var response = await addressData
        .getData(myServices.sharedPreferences.getString("id")!);
    print(response);
    statusReqoust = handlingData(response);
    if (StatusReqoust.success == statusReqoust) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => AddressModel.fromJson(e)));
      } else {
        statusReqoust = StatusReqoust.failure;
      }
    }
    update();
  }

  deletAddress(String addressId) {
    addressData.deleteData(addressId);
    data.retainWhere((element) => element.addressId == addressId);
    update();
  }

  @override
  void onInit() {
    getdata();
    super.onInit();
  }
}
