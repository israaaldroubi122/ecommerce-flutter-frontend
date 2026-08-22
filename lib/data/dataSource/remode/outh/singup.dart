import 'package:ecommerceapp21/core/class/crud.dart';
import 'package:ecommerceapp21/linkapi.dart';

class SingUpData {
  Crud crud;
  SingUpData(this.crud);
  postData(
    String username,
    String password,
    String email,
    String phone,
  ) async {
    var respons = await crud.postData(AppLink.singUp, {
      "username": username,
      "password": password,
      "email": email,
      "phone": phone,
    });

    return respons.fold((l) => l, (r) => r);
  }
}
