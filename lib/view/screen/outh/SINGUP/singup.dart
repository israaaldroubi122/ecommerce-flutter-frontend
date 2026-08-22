import 'package:ecommerceapp21/core/class/statusReqoust.dart';
import 'package:ecommerceapp21/core/function/alertExitApp.dart';
import 'package:ecommerceapp21/core/function/validinput.dart';
import 'package:ecommerceapp21/view/screen/outh/SINGUP/singUp_Controller.dart';
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
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SingUp extends StatelessWidget {
  const SingUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SingUpControllerImp());
    return Scaffold(
        body: WillPopScope(
            onWillPop: aleartExitApp,
            child: GetBuilder<SingUpControllerImp>(
              builder: (controller) => controller.statusReqoust ==
                      StatusReqoust.loading
                  ? const Center(
                      child: Text("Loading...."),
                    )
                  : Stack(
                      children: [
                        const CustomContainerStyleOne(),
                        const CustomContainerStyleTow(),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          child: SingleChildScrollView(
                            child: Form(
                              key: controller.formState,
                              child: Column(
                                children: [
                                  Container(
                                      padding: EdgeInsets.only(top: 35.h),
                                      child: CostomRow(
                                          textButton: "Sing in",
                                          text: "Already have an account?",
                                          onPressed: () {
                                            controller.gotopageLogIn();
                                          })),
                                  const CstomBodyLineOne(text: "Jobsly"),
                                  SizedBox(
                                    height: 40.h,
                                  ),
                                  const CustomBodyTow(text: "Get Started Free"),
                                  SizedBox(
                                    height: 7.h,
                                  ),
                                  const CustomheadLineOne(
                                      text:
                                          "Free Foreever.No Credit card needed"),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  CustomTextFormFiled(
                                    isNumber: false,
                                    valid: (val) {
                                      return validInput(
                                          val!, 10, 50, "username");
                                    },
                                    mycontroller: controller.username,
                                    labelText: "Username",
                                    hintText: "Enter your Username",
                                    icon: Icons.person_outlined,
                                  ),
                                  SizedBox(
                                    height: 25.h,
                                  ),
                                  CustomTextFormFiled(
                                    isNumber: false,
                                    valid: (val) {
                                      return validInput(val!, 5, 100, "email");
                                    },
                                    mycontroller: controller.email,
                                    labelText: "Email",
                                    hintText: "Enter your email",
                                    icon: Icons.email_outlined,
                                  ),
                                  SizedBox(
                                    height: 25.h,
                                  ),
                                  CustomTextFormFiled(
                                    isNumber: true,
                                    valid: (val) {
                                      return validInput(val!, 9, 20, "phone");
                                    },
                                    mycontroller: controller.phone,
                                    labelText: "Phone",
                                    hintText: "Enter your Phone",
                                    icon: Icons.phone_android_outlined,
                                  ),
                                  SizedBox(
                                    height: 25.h,
                                  ),
                                  GetBuilder<SingUpControllerImp>(
                                    builder: (controller) =>
                                        CustomTextFormFiled(
                                      isNumber: false,
                                      valid: (val) {
                                        return validInput(
                                            val!, 5, 30, "password");
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
                                    textButton: "SING UP",
                                    onPressed: () {
                                      controller.singUp();
                                      //  controller.gotopageCheckEmail();
                                    },
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  const CstomRowDivider(
                                      text: "Or Sing in with"),
                                  SizedBox(height: 25.h),
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                  ),
                                  SizedBox(height: 25.h),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
            )));
  }
}
