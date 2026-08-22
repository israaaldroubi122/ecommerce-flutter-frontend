import 'package:ecommerceapp21/core/class/crud.dart';
import 'package:ecommerceapp21/linkapi.dart';

class FavoriteData {
  Crud crud;
  FavoriteData(this.crud);
  addfavorite(String usersid, String itemsid) async {
    var response = await crud
        .postData(AppLink.add, {"usersid": usersid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  removefavorite(String usersid, String itemsid) async {
    var response = await crud
        .postData(AppLink.remove, {"usersid": usersid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }
}
