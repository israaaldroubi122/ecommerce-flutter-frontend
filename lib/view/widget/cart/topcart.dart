import 'package:ecommerceapp21/Style/appStyle.dart';
import 'package:ecommerceapp21/core/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopCart extends StatelessWidget {
  final String message;
  const TopCart({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10, top: 10),
      margin: EdgeInsets.symmetric(
        horizontal: 20.w,
      ),
      height: 40.h,
      width: 340.w,
      decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [AppColor.colorsivenDark, AppColor.c2]),
          borderRadius: BorderRadius.circular(10)),
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: AppStyle.textButton,
      ),
    );
  }
}
