import 'package:ecommerceapp21/view/screen/outh/foldersForgetPassword/verfiyCode/verFiyCode_Controller.dart';
import 'package:ecommerceapp21/view/widget/LOGINAndSINGUP/customContainerStyleOne.dart';
import 'package:ecommerceapp21/view/widget/LOGINAndSINGUP/customContainerStyleTow.dart';
import 'package:ecommerceapp21/view/widget/TextLine/customBodyLineOne.dart';
import 'package:ecommerceapp21/view/widget/TextLine/customTextBodyTow.dart';
import 'package:ecommerceapp21/view/widget/TextLine/customheadLineOne.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class VerfiyCode extends StatelessWidget {
  const VerfiyCode({super.key});

  @override
  Widget build(BuildContext context) {
    VerFiyCodeControllerImp controller = Get.put(VerFiyCodeControllerImp());
    return Scaffold(
        body: Stack(children: [
      const CustomContainerStyleOne(),
      const CustomContainerStyleTow(),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Column(children: [
            SizedBox(
              height: 60.h,
            ),
            const CstomBodyLineOne(text: "Verification Code"),
            SizedBox(
              height: 55.h,
            ),
            const CustomBodyTow(text: "Check Code"),
            SizedBox(
              height: 15.h,
            ),
            const CustomheadLineOne(
                text:
                    "Please Enter The Digit Code Sent To\n            soos@gmail.com"),
            SizedBox(
              height: 45.h,
            ),
            OtpTextField(
              fieldWidth: 50.0,
              borderRadius: BorderRadius.circular(20),
              numberOfFields: 5,
              borderColor: const Color(0xFF513DA8),
              showFieldAsBox: true,
              onCodeChanged: (String code) {},
              onSubmit: (String verificationCode) {
                controller.gotopageResetPassword(verificationCode);
              },
            ),
            SizedBox(
              height: 45.h,
            ),
          ]))
    ]));
  }
}
