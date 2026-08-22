import 'package:ecommerceapp21/Style/appStyle.dart';
import 'package:ecommerceapp21/core/const/colors.dart';
import 'package:ecommerceapp21/view/screen/outh/foldersForgetPassword/SuccessSingUP/successSingUpController.dart';
import 'package:ecommerceapp21/view/widget/LOGINAndSINGUP/CustomMaterialButton.dart';
import 'package:ecommerceapp21/view/widget/TextLine/customTextBodyTow.dart';
import 'package:ecommerceapp21/view/widget/TextLine/customheadLineOne.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SuccessSingUp extends StatelessWidget {
  const SuccessSingUp({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessSingUpControllerImp controller =
        Get.put(SuccessSingUpControllerImp());
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 40.h,
          ),
          Text(
            "Success",
            style: AppStyle.bodLineFour,
          ),
          SizedBox(
            height: 25.h,
          ),
          const Center(
            child: Icon(
              Icons.check_circle_outline,
              size: 220,
              color: AppColor.colorSiven,
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          const CustomBodyTow(text: "Success Sing Up"),
          SizedBox(
            height: 20.h,
          ),
          const CustomheadLineOne(
              text:
                  "Pleas Enter Your Email Address to Recive\n                 Verification Code"),
          const Spacer(),
          CstomMaterialButtom(
            textButton: "SING UP",
            onPressed: () {
              controller.gotoPageLogIn();
            },
          ),
          SizedBox(
            height: 40.h,
          )
        ],
      ),
    );
  }
}
