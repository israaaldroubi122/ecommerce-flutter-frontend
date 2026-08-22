import 'package:ecommerceapp21/core/class/crud.dart';
import 'package:ecommerceapp21/linkapi.dart';

class CheckEmailData {
  Crud crud;
  CheckEmailData(this.crud);
  postData(
    String email,
  ) async {
    var respons = await crud.postData(AppLink.checkEmail, {
      "email": email,
    });
    print("Raw response: $respons");
    return respons.fold((l) => l, (r) => r);
  }
}
