import 'package:ecommerceapp21/Style/appStyle.dart';
import 'package:ecommerceapp21/core/const/colors.dart';
import 'package:ecommerceapp21/core/const/routes.dart';
import 'package:ecommerceapp21/view/screen/outh/productdetails/productdetails_controller.dart';
import 'package:ecommerceapp21/view/widget/productdetailes/customTopProudectdetils.dart';
import 'package:ecommerceapp21/view/widget/productdetailes/customsubitems.dart';
import 'package:ecommerceapp21/view/widget/productdetailes/price&count.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Productdetails extends StatelessWidget {
  const Productdetails({super.key});

  @override
  Widget build(BuildContext context) {
    // ProductdetailscontrollerImp controller =
    Get.put(ProductdetailscontrollerImp());
    return Scaffold(
        bottomNavigationBar: GetBuilder<ProductdetailscontrollerImp>(
          builder: (controller) => Container(
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: [AppColor.colorsivenDark, AppColor.c2]),
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(80.r))),
            height: 60.h,
            child: MaterialButton(
              onPressed: () {
                //  controller.cartController.refreshPage();
                Get.toNamed(AppRoutes.cart);
              },
              child: Text(
                "Go To Cart",
                style: AppStyle.textButton,
              ),
            ),
          ),
        ),
        body: GetBuilder<ProductdetailscontrollerImp>(
            builder: (controller) => ListView(
                  children: [
                    TopProudectDetails(
                      image:
                          "assets/images/${controller.itemsmodel.itemsImage}",
                    ),
                    SizedBox(
                      height: 70.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 17, vertical: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${controller.itemsmodel.itemsName}",
                            style: AppStyle.textThreeBlack,
                          ),
                          PriceandCountItems(
                            price:
                                "${controller.itemsmodel.itemspricediscount}\$",
                            count: "${controller.countitems}",
                            onPressedAdd: () {
                              controller.add();
                            },
                            onPressedremove: () {
                              controller.remove();
                            },
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "${controller.itemsmodel.itemaDesc},${controller.itemsmodel.itemaDesc},${controller.itemsmodel.itemaDesc},${controller.itemsmodel.itemaDesc},${controller.itemsmodel.itemaDesc},${controller.itemsmodel.itemaDesc}",
                            style: AppStyle.bodyTthree,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "color",
                            style: AppStyle.textThreeBlack,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          const SubitemsList(),
                        ],
                      ),
                    ),
                  ],
                )));
  }
}
