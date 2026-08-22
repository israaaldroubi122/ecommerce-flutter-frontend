import 'package:ecommerceapp21/Style/appStyle.dart';
import 'package:ecommerceapp21/data/dataSource/static/static.dart';
import 'package:ecommerceapp21/view/screen/onboarding/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CustomSliderOnboarding extends GetView<OnBoareingControllerImp> {
  const CustomSliderOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pagecontroller,
        onPageChanged: (val) {
          controller.onPageChenged(val);
        },
        itemCount: onboardingList.length,
        itemBuilder: (context, i) => Column(
              children: [
                Image.asset(
                  onboardingList[i].image!,
                  height: 250,
                  width: 200,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 40.h,
                ),
                Text(onboardingList[i].titel!, style: AppStyle.headLineOne),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(onboardingList[i].body!,
                      textAlign: TextAlign.center, style: AppStyle.bodyOne),
                ),
              ],
            ));
  }
}
