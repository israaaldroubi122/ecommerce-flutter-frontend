import 'package:ecommerceapp21/core/class/statusReqoust.dart';

handlingData(response) {
  if (response is StatusReqoust) {
    return response;
  } else {
    return StatusReqoust.success;
  }
}
