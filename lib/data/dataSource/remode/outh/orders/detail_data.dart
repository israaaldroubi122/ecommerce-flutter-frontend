import 'package:ecommerceapp21/core/class/crud.dart';
import 'package:ecommerceapp21/linkapi.dart';

class DetailsData {
  Crud crud;
  DetailsData(this.crud);

  getData(String userid) async {
    var response = await crud.postData(AppLink.orderDetails, {"id": userid});
    return response.fold((l) => l, (r) => r);
  }
}
