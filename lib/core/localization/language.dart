import 'package:ecommerceapp21/Style/appStyle.dart';
import 'package:ecommerceapp21/core/const/routes.dart';
import 'package:ecommerceapp21/core/localization/changLocal_controller.dart';
import 'package:ecommerceapp21/view/widget/changLanguge/customChangeLanguage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Language extends GetView<ChangLocalControllerImp> {
  const Language({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // color: AppColor.colorSixDark,
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "chooseLanguage".tr,
              style: AppStyle.headLineOne,
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomChangeLanguage(
              text: "En",
              onPressed: () {
                controller.changeLanguge("en");
                Get.toNamed(AppRoutes.onBoarding);
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomChangeLanguage(
              text: "Ar",
              onPressed: () {
                controller.changeLanguge("ar");
                Get.toNamed(AppRoutes.onBoarding);
              },
            ),
          ],
        ),
      ),
    );
  }
}
