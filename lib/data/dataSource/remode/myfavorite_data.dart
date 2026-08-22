import 'package:ecommerceapp21/core/class/crud.dart';
import 'package:ecommerceapp21/linkapi.dart';

class MyfavoriteData {
  Crud crud;
  MyfavoriteData(this.crud);
  getdata(
    String id,
  ) async {
    var response = await crud.postData(AppLink.favoriteView, {"id": id});
    return response.fold((l) => l, (r) => r);
  }

  deletData(
    String id,
  ) async {
    var response = await crud.postData(AppLink.deletFromFavorite, {"id": id});
    return response.fold((l) => l, (r) => r);
  }
}
