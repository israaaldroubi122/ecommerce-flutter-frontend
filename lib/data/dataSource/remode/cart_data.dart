import 'package:ecommerceapp21/core/class/crud.dart';
import 'package:ecommerceapp21/linkapi.dart';

class CartData {
  Crud crud;
  CartData(this.crud);
  addcart(String usersid, String itemsid) async {
    var response = await crud
        .postData(AppLink.cartAdd, {"usersid": usersid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  rmovecart(String usersid, String itemsid) async {
    var response = await crud
        .postData(AppLink.cartremove, {"usersid": usersid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  getcountitems(String usersid, String itemsid) async {
    var response = await crud
        .postData(AppLink.cartremove, {"usersid": usersid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  cartView(
    String usersid,
  ) async {
    var response = await crud.postData(AppLink.cartview, {
      "usersid": usersid,
    });
    return response.fold((l) => l, (r) => r);
  }

  checkCoupon(
    String couponname,
  ) async {
    var response = await crud.postData(AppLink.checkCoupon, {
      "couponname": couponname,
    });
    return response.fold((l) => l, (r) => r);
  }
}
