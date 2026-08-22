import 'package:ecommerceapp21/core/const/colors.dart';
import 'package:ecommerceapp21/view/screen/onboarding/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CustomBottonOnBoarding extends GetView<OnBoareingControllerImp> {
  const CustomBottonOnBoarding({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 70.h),
        height: 40,
        child: MaterialButton(
          padding: EdgeInsets.symmetric(horizontal: 100.w),
          onPressed: () {
            controller.next();
          },
          color: AppColor.colorTowDark,
          child: const Text(
            "Contune",
            style: TextStyle(color: Colors.white),
          ),
        ));
  }
}
