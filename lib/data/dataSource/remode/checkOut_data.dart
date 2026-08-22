import 'package:ecommerceapp21/core/class/crud.dart';
import 'package:ecommerceapp21/linkapi.dart';

class CheckOutData {
  Crud crud;
  CheckOutData(this.crud);
  checkOut(Map data) async {
    var response = await crud.postData(AppLink.checkOrder, data);
    return response.fold((l) => l, (r) => r);
  }
}
