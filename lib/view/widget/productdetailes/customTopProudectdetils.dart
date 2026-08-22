import 'package:ecommerceapp21/core/const/colors.dart';
import 'package:ecommerceapp21/view/screen/outh/productdetails/productdetails_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TopProudectDetails extends GetView<ProductdetailscontrollerImp> {
  final String image;

  const TopProudectDetails({
    super.key,
    required this.image,
  });
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 200.h,
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                  colors: [AppColor.colorsivenDark, AppColor.c2]),
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(80.r))),
        ),
        Positioned(
            right: Get.width / 8,
            left: Get.width / 8,
            //height: 0,

            child: Image.asset(
              image,
              height: 300,
              fit: BoxFit.fill,
            )),
      ],
    );
  }
}
