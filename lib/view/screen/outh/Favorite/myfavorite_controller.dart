import 'package:ecommerceapp21/core/class/statusReqoust.dart';
import 'package:ecommerceapp21/core/function/handlingDataController.dart';
import 'package:ecommerceapp21/core/services/services.dart';
import 'package:ecommerceapp21/data/dataSource/remode/myfavorite_data.dart';
import 'package:ecommerceapp21/data/model/myfavoriteModel.dart';

import 'package:get/get.dart';

class MyFavoriteController extends GetxController {
  List<MyfavoeiteModel> data = [];
  late StatusReqoust statusReqoust;

  MyServices myServices = Get.find();
  MyfavoriteData myfavoriteData = MyfavoriteData(Get.find());

  Map isfavorite = {};

//  setfavorite(id, val) {
  //  isfavorite[id] = val;
  //update();
  // }

  getdata() async {
    data.clear();
    statusReqoust = StatusReqoust.loading;
    var respons = await myfavoriteData.getdata(
      myServices.sharedPreferences.getString("id")!,
    );
    print("$respons");
    statusReqoust = handlingData(respons);
    if (StatusReqoust.success == statusReqoust) {
      if (respons['status'] == 'success') {
        List responseData = respons['data'];
        data.addAll(responseData.map((e) => MyfavoeiteModel.fromJson(e)));
        print("data");
        print(data);
        // data.addAll(respons['data']);
      } else {
        statusReqoust = StatusReqoust.failure;
      }
    }
    update();
  }

  deletFromFavorite(String favoriteId) {
    //data.clear();
    // statusReqoust = StatusReqoust.loading;
    var respons = myfavoriteData.deletData(
      favoriteId,
    );
    print("$respons");
    // statusReqoust = handlingData(respons);
    // if (StatusReqoust.success == statusReqoust) {
    //if (respons['status'] == 'success') {
    // List responseData = respons['data'];
    // data.addAll(responseData.map((e) => MyfavoeiteModel.fromJson(e)));
    // print("data");
    // print(data);
    // data.addAll(respons['data']);
    data.removeWhere((element) => element.favoritId == favoriteId);
    //} else {
    //  statusReqoust = StatusReqoust.failure;
    // }
    // }
    update();
  }

  @override
  void onInit() {
    getdata();
    //deletFromFavorite();
    super.onInit();
  }
}
