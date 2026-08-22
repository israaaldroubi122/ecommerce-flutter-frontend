import 'package:ecommerceapp21/core/class/crud.dart';
import 'package:ecommerceapp21/linkapi.dart';

class LogInData {
  Crud crud;
  LogInData(this.crud);
  postData(
    String password,
    String email,
  ) async {
    var respons = await crud.postData(AppLink.logIn, {
      "password": password,
      "email": email,
    });

    return respons.fold((l) => l, (r) => r);
  }
}
