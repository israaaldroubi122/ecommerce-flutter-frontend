import 'package:ecommerceapp21/Style/appStyle.dart';
import 'package:ecommerceapp21/core/const/colors.dart';
import 'package:ecommerceapp21/view/screen/outh/productdetails/productdetails_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubitemsList extends GetView<ProductdetailscontrollerImp> {
  const SubitemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          controller.subitems.length,
          (index) => Container(
            margin: const EdgeInsets.only(right: 12),
            alignment: Alignment.center,
            height: 60,
            width: 80,
            decoration: BoxDecoration(
                color: controller.subitems[index]['active'] == '1'
                    ? AppColor.colorsivenDark
                    : Colors.white,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(20)),
            child: Text(
              controller.subitems[index]['name'],
              style: controller.subitems[index]['active'] == '1'
                  ? AppStyle.bodyTowWhite
                  : AppStyle.bodyTowBlack,
            ),
          ),
        ),
      ],
    );
  }
}
