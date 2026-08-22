import 'package:ecommerceapp21/core/class/crud.dart';
import 'package:ecommerceapp21/linkapi.dart';

class ResetPasswordData {
  Crud crud;
  ResetPasswordData(this.crud);
  postData(
    String email,
    String password,
  ) async {
    var respons = await crud.postData(AppLink.resetpassword, {
      "email": email,
      "password": password,
    });
    print("Raw response: $respons");
    return respons.fold((l) => l, (r) => r);
  }
}
