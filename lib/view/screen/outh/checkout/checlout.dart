import 'package:ecommerceapp21/Style/appStyle.dart';
import 'package:ecommerceapp21/core/const/colors.dart';
import 'package:ecommerceapp21/core/const/images.dart';
import 'package:ecommerceapp21/core/const/routes.dart';
import 'package:ecommerceapp21/view/screen/outh/checkout/checkOutController.dart';
import 'package:ecommerceapp21/view/widget/checkOut/cardDeliveryType.dart';
import 'package:ecommerceapp21/view/widget/checkOut/cardPymentMethod.dart';
import 'package:ecommerceapp21/view/widget/checkOut/cardaddress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    CheckOutController controller = Get.put(CheckOutController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("CheckOute"),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: MaterialButton(
            color: AppColor.c2,
            textColor: Colors.white,
            onPressed: () {
              controller.checkOut();
            },
            child: const Text(
              "CheckOut",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        ),
        body: GetBuilder<CheckOutController>(
            builder: (controller) => Container(
                  padding: const EdgeInsets.all(20),
                  child: ListView(
                    children: [
                      Text(
                        "Choose Payment Method",
                        style: AppStyle.headLineOne,
                      ),
                      InkWell(
                        onTap: () {
                          controller.choosepaymenyMethod("0");
                        },
                        child: CardPaymentMethodCheckOut(
                          titel: "Cash on Delivery",
                          isActive:
                              controller.paymenyMethod == "0" ? true : false,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      InkWell(
                        onTap: () {
                          controller.choosepaymenyMethod("1");
                        },
                        child: CardPaymentMethodCheckOut(
                          titel: "Payment Cards",
                          isActive:
                              controller.paymenyMethod == "1" ? true : false,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "Choose Delivry Type",
                        style: AppStyle.headLineOne,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              controller.choosedelivaryType("0");
                            },
                            child: CardDelivaryTypeCheckOut(
                              imageName: AssetsImages.onBoardingOne,
                              titel: "Delivary",
                              isActive:
                                  controller.delivaryType == "0" ? true : false,
                            ),
                          ),
                          SizedBox(
                            width: 10.h,
                          ),
                          InkWell(
                            onTap: () {
                              controller.choosedelivaryType("1");
                            },
                            child: CardDelivaryTypeCheckOut(
                              imageName: AssetsImages.onBoardingTow,
                              titel: "Recive",
                              isActive:
                                  controller.delivaryType == "1" ? true : false,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      if (controller.delivaryType == "0")
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (controller.dataaddress.isNotEmpty)
                              Text(
                                "Shepping address",
                                style: AppStyle.headLineOne,
                              ),
                            if (controller.dataaddress.isEmpty)
                              InkWell(
                                onTap: () {
                                  Get.toNamed(AppRoutes.addressAdd);
                                },
                                child: Container(
                                  child: Center(
                                      child: Text(
                                          "please Add Shepping A ddress\n Cleck Here")),
                                ),
                              ),
                            SizedBox(height: 20.h),
                            ...List.generate(
                              controller.dataaddress.length,
                              (index) => InkWell(
                                onTap: () {
                                  controller.chooseaddressId(
                                      controller.dataaddress[index].addressId!);
                                },
                                child: CardAddressCheckOut(
                                  titel:
                                      "${controller.dataaddress[index].addressName}",
                                  body:
                                      " ${controller.dataaddress[index].addressCity} ${controller.dataaddress[index].addressStreet}",
                                  isActive: controller.addressId ==
                                          controller
                                              .dataaddress[index].addressId
                                      ? true
                                      : false,
                                ),
                              ),
                            )
                          ],
                        )
                    ],
                  ),
                )));
  }
}
