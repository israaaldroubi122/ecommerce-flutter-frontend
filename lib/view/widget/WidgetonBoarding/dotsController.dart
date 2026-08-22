import 'package:ecommerceapp21/core/const/colors.dart';
import 'package:ecommerceapp21/data/dataSource/static/static.dart';
import 'package:ecommerceapp21/view/screen/onboarding/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class DotsController extends StatelessWidget {
  const DotsController({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoareingControllerImp>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    onboardingList.length,
                    (index) => AnimatedContainer(
                          margin: const EdgeInsets.only(right: 5),
                          duration: const Duration(milliseconds: 900),
                          width: controller.currentPage == index ? 20.w : 5.w,
                          height: 6.h,
                          decoration: BoxDecoration(
                              color: AppColor.colorTowDark,
                              borderRadius: BorderRadius.circular(10.r)),
                        ))
              ],
            ));
  }
}
