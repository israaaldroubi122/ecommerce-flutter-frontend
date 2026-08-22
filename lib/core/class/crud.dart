import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:ecommerceapp21/core/class/statusReqoust.dart';
import 'package:ecommerceapp21/core/function/checkinternet.dart';

import 'package:http/http.dart' as http;
/*
class Crud {
  Future<Either<StatusReqoust, Map>> postData(String linkurI, Map data) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(Uri.parse(linkurI), body: data);

        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          return right(responseBody);
          //return left(StatusReqoust.failure);
        } else {
          return left(StatusReqoust.serverfailure);
        }
      } else {
        return left(StatusReqoust.offlinefailure);
      }
    } catch (_) {
      return left(StatusReqoust.severExcption);
    }
  }
}
*/

class Crud {
  Future<Either<StatusReqoust, Map>> postData(String linkurI, Map data) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(Uri.parse(linkurI), body: data);

        print("🔗 API URL: $linkurI");
        print("📤 Sent Data: $data");
        print("📥 Status Code: ${response.statusCode}");
        print("📥 Response Body: ${response.body}");

        if (response.statusCode == 200 || response.statusCode == 201) {
          try {
            Map responseBody = jsonDecode(response.body);
            return right(responseBody);
          } catch (e) {
            print("❌ JSON Decode Error: $e");
            return left(StatusReqoust.serverfailure); // Invalid JSON
          }
        } else {
          return left(StatusReqoust.serverfailure);
        }
      } else {
        print("📡 No internet connection");
        return left(StatusReqoust.offlinefailure);
      }
    } catch (e) {
      print("❌ Exception during HTTP request: $e");
      return left(StatusReqoust.severExcption);
    }
  }
}
