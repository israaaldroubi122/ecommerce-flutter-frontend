import 'package:ecommerceapp21/Style/appStyle.dart';
import 'package:ecommerceapp21/view/screen/outh/cart/cart_controller.dart';
import 'package:ecommerceapp21/view/widget/cart/customCartItemsList.dart';
import 'package:ecommerceapp21/view/widget/cart/customrowBotton.dart';
import 'package:ecommerceapp21/view/widget/cart/topcart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
    return Scaffold(
        bottomNavigationBar: GetBuilder<CartController>(
          builder: (controller) => CustomBottonNavigation(
            price: "${cartController.priceOrder}",
            totalPrice: "${cartController.getTotalPrice()}",
            discoint: "${cartController.discountCoupon}%",
            controllerCoupon: controller.controllerCoupon!,
            onPressedCouponApply: () {
              controller.checkCoupon();
            },
            shepping: "100",
            onPressedcheckOut: () {
              controller.gotopagecheckOut();
            },
          ),
        ),
        appBar: AppBar(
          title: Center(
              child: Text(
            "My Cart",
            style: AppStyle.headLinelarg,
          )),
        ),
        body: GetBuilder<CartController>(
          builder: (controller) => Container(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Column(
              children: [
                TopCart(
                  message:
                      "you have ${cartController.totalcountItems} items in your list",
                ),
                SizedBox(
                  height: 20.h,
                ),
                ...List.generate(
                  controller.data.length,
                  (index) => CustomCartListItem(
                      image:
                          "assets/images/${controller.data[index].itemsImage}",
                      onPressedadd: () async {
                        await cartController
                            .addcart(controller.data[index].itemsId!);
                        cartController.refreshPage();
                        // cartcontroller.add();
                      },
                      // onPressedremove: () async {
                      // await cartController
                      //   .removecart(controller.data[index].itemsId!);
                      // cartController.refreshPage();
                      // },

                      onPressedremove: () async {
                        if (int.parse(controller.data[index].countitems!) > 0) {
                          // 1) نقص العدد محليًا
                          controller.data[index].countitems =
                              (int.parse(controller.data[index].countitems!) -
                                      1)
                                  .toString();

                          controller.update(); // تحديث الـ UI فورًا

                          // 2) نفذ الحذف على السيرفر
                          await cartController
                              .removecart(controller.data[index].itemsId!);

                          // 3) رجّع البيانات من السيرفر للتأكد
                          cartController.refreshPage();
                        }
                      },
                      name: "${cartController.data[index].itemsName}",
                      price: "${cartController.data[index].itemsPrice}",
                      count: "${cartController.data[index].countitems}"),
                )
              ],
            ),
          ),
        ));
  }
}
