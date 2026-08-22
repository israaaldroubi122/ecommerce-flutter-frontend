import 'package:ecommerceapp21/core/function/validinput.dart';
import 'package:ecommerceapp21/view/screen/outh/foldersForgetPassword/resetPassword/resetPassword_Controller.dart';
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

class ResetPassWord extends StatelessWidget {
  const ResetPassWord({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPassWordControllerImp controller =
        Get.put(ResetPassWordControllerImp());
    return Scaffold(
        body: Stack(children: [
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
              const CstomBodyLineOne(text: "Reset Password"),
              SizedBox(
                height: 55.h,
              ),
              const CustomBodyTow(text: "New Password"),
              SizedBox(
                height: 15.h,
              ),
              const CustomheadLineOne(text: "Please Enter New Password"),
              SizedBox(
                height: 45.h,
              ),
              CustomTextFormFiled(
                isNumber: false,
                valid: (val) {
                  return validInput(val!, 5, 30, "password");
                },
                mycontroller: controller.password,
                labelText: "Password",
                hintText: "Enter your Password",
                icon: Icons.lock_clock_outlined,
              ),
              SizedBox(
                height: 45.h,
              ),
              CustomTextFormFiled(
                isNumber: false,
                valid: (val) {
                  return validInput(val!, 5, 30, "password");
                },
                mycontroller: controller.repassword,
                labelText: "RePassword",
                hintText: "Enter your RePassword",
                icon: Icons.lock_clock_outlined,
              ),
              SizedBox(
                height: 45.h,
              ),
              CstomMaterialButtom(
                textButton: "  Save  ",
                onPressed: () {
                  controller.gotopageSuccessResetPassWord();
                },
              ),
            ]),
          ))
    ]));
  }
}
