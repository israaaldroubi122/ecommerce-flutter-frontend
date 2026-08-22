import 'package:ecommerceapp21/view/screen/onboarding/onboarding_controller.dart';
import 'package:ecommerceapp21/view/widget/WidgetonBoarding/customBotton.dart';
import 'package:ecommerceapp21/view/widget/WidgetonBoarding/customSlaider.dart';
import 'package:ecommerceapp21/view/widget/WidgetonBoarding/dotsController.dart';
import 'package:flutter/material.dart';

import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoareingControllerImp());
    return const Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Expanded(flex: 3, child: CustomSliderOnboarding()),
          Expanded(
              flex: 2,
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  DotsController(),
                  Spacer(
                    flex: 1,
                  ),
                  CustomBottonOnBoarding()
                ],
              ))
        ],
      ),
    ));
  }
}
