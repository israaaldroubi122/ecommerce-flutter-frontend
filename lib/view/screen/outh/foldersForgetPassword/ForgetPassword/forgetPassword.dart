import 'package:ecommerceapp21/core/class/statusReqoust.dart';
import 'package:ecommerceapp21/core/function/validinput.dart';
import 'package:ecommerceapp21/view/screen/outh/foldersForgetPassword/ForgetPassword/forgetPassword_controller.dart';
import 'package:ecommerceapp21/view/widget/LOGINAndSINGUP/CustomMaterialButton.dart';
import 'package:ecommerceapp21/view/widget/LOGINAndSINGUP/customContainerStyleOne.dart';
import 'package:ecommerceapp21/view/widget/LOGINAndSINGUP/customContainerStyleTow.dart';
import 'package:ecommerceapp21/view/widget/LOGINAndSINGUP/customTextFormFiled.dart';
import 'package:ecommerceapp21/view/widget/TextLine/customBodyLineOne.dart';
import 'package:ecommerceapp21/view/widget/TextLine/customTextBodyTow.dart';
import 'package:ecommerceapp21/view/widget/TextLine/customheadLineOne.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
        body: GetBuilder<ForgetPasswordControllerImp>(
            builder: (controller) =>
                controller.statusReqoust == StatusReqoust.loading
                    ? Center(
                        child: Text("looding...."),
                      )
                    : Stack(children: [
                        const CustomContainerStyleOne(),
                        const CustomContainerStyleTow(),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.w),
                            child: Form(
                              key: controller.formState,
                              child: Column(children: [
                                SizedBox(
                                  height: 60.h,
                                ),
                                const CstomBodyLineOne(text: "Forget Password"),
                                SizedBox(
                                  height: 55.h,
                                ),
                                const CustomBodyTow(text: "Check Email"),
                                SizedBox(
                                  height: 15.h,
                                ),
                                const CustomheadLineOne(
                                    text:
                                        "Pleas Enter Your Email Address to Recive\n                 Verification Code"),
                                SizedBox(
                                  height: 45.h,
                                ),
                                CustomTextFormFiled(
                                  isNumber: false,
                                  valid: (val) {
                                    return validInput(val!, 5, 50, "email");
                                  },
                                  mycontroller: controller.email,
                                  labelText: "Email",
                                  hintText: "Enter your Email",
                                  icon: Icons.person_outlined,
                                ),
                                SizedBox(
                                  height: 45.h,
                                ),
                                CstomMaterialButtom(
                                  textButton: "  Check  ",
                                  onPressed: () {
                                    controller.checkEmail();
                                  },
                                ),
                              ]),
                            ))
                      ])));
  }
}
