import 'package:ecommerceapp21/core/class/crud.dart';
import 'package:ecommerceapp21/linkapi.dart';

class VerfiyCodeSingUpData {
  Crud crud;
  VerfiyCodeSingUpData(this.crud);
  postData(
    String email,
    String verfiycode,
  ) async {
    var respons = await crud.postData(AppLink.verfiyCodeSingUp, {
      "email": email,
      "users_veryfiycode": verfiycode,
    });
    print("Raw response: $respons");
    return respons.fold((l) => l, (r) => r);
  }
}
