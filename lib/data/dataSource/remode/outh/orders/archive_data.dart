import 'package:ecommerceapp21/core/class/crud.dart';
import 'package:ecommerceapp21/linkapi.dart';

class OrderArchiveData {
  Crud crud;
  OrderArchiveData(this.crud);

  getData(String userid) async {
    var response = await crud.postData(AppLink.archiveOrder, {"id": userid});
    return response.fold((l) => l, (r) => r);
  }
}
