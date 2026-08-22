import 'package:ecommerceapp21/view/screen/outh/Offers/offers.dart';
import 'package:ecommerceapp21/view/screen/outh/Setting/setting.dart';
import 'package:ecommerceapp21/view/screen/outh/HomePage/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentPage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentPage = 0;
  List<Widget> listpage = [
    const HomePage(),
    const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text("setting"),
        ),
      ],
    ),
    const Offers(),
    const Setting(),
  ];
  List bottonAppBar = [
    {
      "title": "home",
      "icon": Icons.home,
    },
    {
      "title": "ca",
      "icon": Icons.notification_add_outlined,
    },
    {
      "title": "Offers",
      "icon": Icons.offline_bolt_outlined,
    },
    {
      "title": "Setting",
      "icon": Icons.settings,
    },
  ];

  @override
  changePage(int i) {
    currentPage = i;
    update();
  }
}
