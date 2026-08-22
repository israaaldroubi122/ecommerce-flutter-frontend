import 'package:ecommerceapp21/core/function/alertExitApp.dart';
import 'package:ecommerceapp21/core/function/validinput.dart';
import 'package:ecommerceapp21/view/screen/outh/LOGIN/logIn_Controller.dart';
import 'package:ecommerceapp21/view/widget/LOGINAndSINGUP/CustomMaterialButton.dart';
import 'package:ecommerceapp21/view/widget/LOGINAndSINGUP/CustomRow.dart';
import 'package:ecommerceapp21/view/widget/LOGINAndSINGUP/CustomRowDivider.dart';
import 'package:ecommerceapp21/view/widget/LOGINAndSINGUP/custom.dart';
import 'package:ecommerceapp21/view/widget/LOGINAndSINGUP/customContainerStyleOne.dart';
import 'package:ecommerceapp21/view/widget/LOGINAndSINGUP/customContainerStyleTow.dart';
import 'package:ecommerceapp21/view/widget/LOGINAndSINGUP/customTextFormFiled.dart';
import 'package:ecommerceapp21/view/widget/TextLine/customBodyLineOne.dart';
import 'package:ecommerceapp21/view/widget/TextLine/customTextBodyTow.dart';
import 'package:ecommerceapp21/view/widget/TextLine/customheadLineOne.dart';
import 'package:ecommerceapp21/view/widget/TextLine/customheadLineTow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller = Get.put(LoginControllerImp());
    return Scaffold(
        body: WillPopScope(
      onWillPop: aleartExitApp,
      child: Stack(
        children: [
          const CustomContainerStyleOne(),
          const CustomContainerStyleTow(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Form(
              key: controller.formState,
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.only(top: 35.h),
                      child: CostomRow(
                          textButton: "Get started",
                          text: "Don`t have an account?",
                          onPressed: () {
                            controller.gotoPageSingUp();
                          })),
                  const CstomBodyLineOne(text: "Jobsly"),
                  SizedBox(
                    height: 40.h,
                  ),
                  const CustomBodyTow(text: "Wolcom Back"),
                  SizedBox(
                    height: 7.h,
                  ),
                  const CustomheadLineOne(text: "Enter your detailes below"),
                  SizedBox(
                    height: 30.h,
                  ),
                  CustomTextFormFiled(
                    isNumber: false,
                    valid: (val) {
                      return validInput(val!, 5, 50, "email");
                    },
                    mycontroller: controller.email,
                    labelText: "Email",
                    hintText: "Enter your email",
                    icon: Icons.email_outlined,
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  GetBuilder<LoginControllerImp>(
                    builder: (controller) => CustomTextFormFiled(
                      isNumber: false,
                      valid: (val) {
                        return validInput(val!, 5, 30, "password");
                      },
                      mycontroller: controller.password,
                      obscureText: controller.isShowPassword,
                      onTapIcon: () {
                        controller.showPassword();
                      },
                      labelText: "Password",
                      hintText: "Enter your password",
                      icon: Icons.lock_clock_outlined,
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  CstomMaterialButtom(
                    textButton: "SING IN",
                    onPressed: () {
                      controller.login();
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomheadLineTow(
                    text: "Forget Your Password?",
                    onPressed: () {
                      controller.gotoPageForgetPassWord();
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const CstomRowDivider(text: "Or Sing in with"),
                  SizedBox(height: 25.h),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Custom(
                        text: "Googel",
                        icon: Icons.report_gmailerrorred,
                      ),
                      Custom(
                        text: "Facebook",
                        icon: Icons.facebook_outlined,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
