import 'package:ecommerceapp21/core/class/crud.dart';
import 'package:ecommerceapp21/linkapi.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);
  getdata(String id, String usersid) async {
    var response = await crud
        .postData(AppLink.items, {"id": id.toString(), "usersid": usersid});
    return response.fold((l) => l, (r) => r);
  }
}
