import 'package:ecommerceapp21/Style/appStyle.dart';
import 'package:ecommerceapp21/core/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardPaymentMethodCheckOut extends StatelessWidget {
  final String titel;
  final bool isActive;
  const CardPaymentMethodCheckOut(
      {super.key, required this.titel, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
          color: isActive == true ? AppColor.c2 : AppColor.c3,
          borderRadius: BorderRadius.circular(20)),
      child: Text(
        titel,
        style: isActive == true ? AppStyle.textButton : AppStyle.textThreeBlack,
      ),
    );
  }
}
