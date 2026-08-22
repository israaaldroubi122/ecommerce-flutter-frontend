import 'package:ecommerceapp21/Style/appStyle.dart';
import 'package:ecommerceapp21/core/const/colors.dart';
import 'package:ecommerceapp21/view/widget/cart/customBottonCouponCart.dart';
import 'package:ecommerceapp21/view/widget/cart/custombuttonNavigationbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottonNavigation extends StatelessWidget {
  final TextEditingController controllerCoupon;
  final Function()? onPressedCouponApply;
  final String price;
  final String discoint;
  final String totalPrice;
  final String shepping;
  final Function()? onPressedcheckOut;
  const CustomBottonNavigation(
      {super.key,
      required this.price,
      required this.discoint,
      required this.totalPrice,
      required this.controllerCoupon,
      required this.onPressedCouponApply,
      required this.shepping,
      required this.onPressedcheckOut});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: TextFormField(
                    controller: controllerCoupon,
                    decoration: InputDecoration(
                        isDense: true,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        hintText: "Coupon Code",
                        border: OutlineInputBorder()),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                    flex: 1,
                    child: CustomBottonCouponCart(
                        textCoupon: "apply",
                        onPressedCoupon: onPressedCouponApply))
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration:
                BoxDecoration(border: Border.all(color: AppColor.c2, width: 1)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Text(
                          "Price",
                          style: AppStyle.textThreeBlack,
                        )),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Text(
                          "$price\$",
                          style: AppStyle.textThreeBlack,
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Text(
                          "discoint",
                          style: AppStyle.textThreeBlack,
                        )),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "$discoint",
                          style: AppStyle.textThreeBlack,
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Text(
                          "Shepping",
                          style: AppStyle.textThreeBlack,
                        )),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "$shepping",
                          style: AppStyle.textThreeBlack,
                        )),
                  ],
                ),
                Divider(
                  color: Colors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Text(
                          "Total Price",
                          style: AppStyle.textcardtow,
                        )),
                    Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Text(
                          "$totalPrice\$",
                          style: AppStyle.textcardtow,
                        )),
                  ],
                ),
              ],
            ),
          ),
          CustomBottonvaigationBar(
            text: "plaes order",
            onPressed: onPressedcheckOut,
          ),
        ],
      ),
    );
  }
}
