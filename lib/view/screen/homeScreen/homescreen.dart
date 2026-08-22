import 'dart:io';
import 'package:ecommerceapp21/core/const/colors.dart';
import 'package:ecommerceapp21/view/screen/homeScreen/homescreen_controller.dart';
import 'package:ecommerceapp21/view/widget/home/customBottonAppBarHome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Scaffold(
            //  backgroundColor: Colors.amber,
            bottomNavigationBar: const CustomBttonAppBar(),
            body: WillPopScope(
              child: controller.listpage.elementAt(controller.currentPage),
              onWillPop: () {
                Get.defaultDialog(
                    title: "Warning",
                    middleText: "Do You Want To Exit The App",
                    onCancel: () {},
                    cancelTextColor: Colors.white,
                    confirmTextColor: Colors.white,
                    buttonColor: AppColor.c2,
                    onConfirm: () {
                      exit(0);
                    });
                return Future.value(false);
              },
            )));
  }
}



  //  floatingActionButton: FloatingActionButton(
  //            backgroundColor: AppColor.c2,
  //            onPressed: () {},
  //            child: const Icon(Icons.shopping_basket_outlined),
  //          ),
  //          floatingActionButtonLocation:
  //              FloatingActionButtonLocation.centerDocked,