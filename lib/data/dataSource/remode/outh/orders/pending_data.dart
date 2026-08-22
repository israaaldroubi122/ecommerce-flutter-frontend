import 'package:ecommerceapp21/core/class/crud.dart';
import 'package:ecommerceapp21/linkapi.dart';

class PendingData {
  Crud crud;
  PendingData(this.crud);

  getData(String userid) async {
    var response = await crud.postData(AppLink.pendingOrder, {"id": userid});
    return response.fold((l) => l, (r) => r);
  }

  deletData(String orderid) async {
    var response =
        await crud.postData(AppLink.ordersDelete, {"orderid": orderid});
    return response.fold((l) => l, (r) => r);
  }
}
