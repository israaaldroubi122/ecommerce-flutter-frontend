import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "not valid username";
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "net valid email";
    }
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "not valid phone";
    }
  }

  if (val.length < min) {
    return "can`t be lees Than $min";
  }
  if (val.length > max) {
    return "can`t be large Than $max";
  }
  if (val.isEmpty) {
    return "can`t be Empty";
  }
}
