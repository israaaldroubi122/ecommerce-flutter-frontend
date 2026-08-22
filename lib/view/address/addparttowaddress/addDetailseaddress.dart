import 'package:ecommerceapp21/view/address/addparttowaddress/addDetilseaddress_controller.dart';
import 'package:ecommerceapp21/view/widget/LOGINAndSINGUP/CustomMaterialButton.dart';
import 'package:ecommerceapp21/view/widget/LOGINAndSINGUP/customTextFormFiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddDetailseAddress extends StatelessWidget {
  const AddDetailseAddress({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddDetailseAddresscontroller());
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Detailse address"),
        ),
        body: GetBuilder<AddDetailseAddresscontroller>(
            builder: ((controller) => Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 30.h),
                  child: ListView(
                    children: [
                      CustomTextFormFiled(
                        labelText: "City",
                        hintText: "City",
                        valid: (val) {},
                        isNumber: false,
                        icon: Icons.location_city,
                        mycontroller: controller.city,
                      ),
                      SizedBox(
                        height: 23.h,
                      ),
                      CustomTextFormFiled(
                        labelText: "Street",
                        hintText: "Street",
                        valid: (val) {},
                        isNumber: false,
                        icon: Icons.streetview,
                        mycontroller: controller.street,
                      ),
                      SizedBox(
                        height: 23.h,
                      ),
                      CustomTextFormFiled(
                        labelText: "name",
                        hintText: "name",
                        valid: (val) {},
                        isNumber: false,
                        icon: Icons.near_me,
                        mycontroller: controller.name,
                      ),
                      SizedBox(
                        height: 55.h,
                      ),
                      CstomMaterialButtom(
                        textButton: "     Add",
                        onPressed: () {
                          controller.addadrress();
                          //Get.toNamed()
                        },
                      )
                    ],
                  ),
                ))));
  }
}
