import 'package:ecommerceapp21/Style/appStyle.dart';
import 'package:ecommerceapp21/core/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottonCouponCart extends StatelessWidget {
  final String textCoupon;
  final void Function()? onPressedCoupon;
  const CustomBottonCouponCart(
      {super.key, required this.textCoupon, this.onPressedCoupon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [AppColor.colorsivenDark, AppColor.c2]),
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(80.r))),
      height: 50.h,
      width: 400,
      child: MaterialButton(
        onPressed: onPressedCoupon,
        child: Text(
          textCoupon,
          style: AppStyle.textButton,
        ),
      ),
    );
  }
}
