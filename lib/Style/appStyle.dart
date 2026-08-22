import 'package:ecommerceapp21/core/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyle {
  static final TextStyle headLineOne = TextStyle(
      fontSize: 20.sp, fontWeight: FontWeight.w500, color: AppColor.textTow);
  static final TextStyle headLinelarg = TextStyle(
      fontSize: 25.sp, fontWeight: FontWeight.w500, color: AppColor.textTow);
  static final TextStyle bodyOne =
      TextStyle(height: 1.5, color: AppColor.textThree, fontSize: 16.sp);
  static final TextStyle bodyTowWhite = TextStyle(
      height: 1.6,
      color: AppColor.textOne,
      fontSize: 14.3.sp,
      fontWeight: FontWeight.w400);
  static final TextStyle bodyTowWhitetow = TextStyle(
      //   height: 1.6,
      color: AppColor.textOne,
      fontSize: 20.3.sp,
      fontWeight: FontWeight.w400);
  //
  static final TextStyle bodyTthree = TextStyle(
      //height: 1.6,
      color: Colors.grey[700],
      fontSize: 12.3.sp,
      fontWeight: FontWeight.w300);
  static final TextStyle bodyTowBlack = TextStyle(
      height: 1.6,
      color: Colors.black,
      fontSize: 14.3.sp,
      fontWeight: FontWeight.w400);

  //
  static final TextStyle textLarge = TextStyle(
      height: 2,
      color: AppColor.textOne,
      fontSize: 30.sp,
      fontWeight: FontWeight.w600);
  static final TextStyle left = TextStyle(
      // height: 2,
      color: Colors.black,
      fontSize: 17.sp,
      fontWeight: FontWeight.bold);

  static final TextStyle textThreegrow = TextStyle(
      height: 2,
      color: AppColor.textThree,
      fontSize: 18.sp,
      fontWeight: FontWeight.w600);
  static final TextStyle textThreeBlack = TextStyle(
      height: 2,
      color: Colors.black,
      fontSize: 18.sp,
      fontWeight: FontWeight.w700);
  static final TextStyle textGrey = TextStyle(
      height: 2,
      color: Colors.grey[700],
      fontSize: 16.sp,
      fontWeight: FontWeight.w700);

  static final TextStyle bodLineThree = TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: const Color.fromARGB(255, 127, 127, 127));

  static final TextStyle bodLineFour = TextStyle(
      fontSize: 28.sp,
      fontWeight: FontWeight.w700,
      color: AppColor.colorsivenDark);
  static final TextStyle textButton = TextStyle(
      fontSize: 18.sp, fontWeight: FontWeight.w500, color: AppColor.textOne);

  ////
  static final TextStyle textcardone = TextStyle(
      color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w400);
  static final TextStyle textcardtow = TextStyle(
      height: 1.1,
      fontSize: 18.sp,
      fontWeight: FontWeight.w500,
      color: AppColor.c2);

  static final TextStyle textcardtow2 = TextStyle(
      height: 1.9,
      fontSize: 22.sp,
      fontWeight: FontWeight.w500,
      color: AppColor.c2);
}
