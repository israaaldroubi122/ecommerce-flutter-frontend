import 'package:ecommerceapp21/Style/appStyle.dart';
import 'package:ecommerceapp21/core/const/colors.dart';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCardHome extends StatelessWidget {
  final String title;
  final String body;
  const CustomCardHome({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 20.dg,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            alignment: Alignment.center,
            height: 150.h,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColor.c1, // بنفسجي فاتح
                  AppColor.c2, // بنفسجي غامق
                ],
              ),
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [
                BoxShadow(
                  color: AppColor.c2.withOpacity(0.3),
                  blurRadius: 15,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: ListTile(
              title: Text(
                title,
                style: AppStyle.headLineOne.copyWith(
                  color: Colors.white, // النص أبيض عشان يبان فوق الخلفية
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                body,
                style: AppStyle.headLinelarg.copyWith(
                  color: Colors.white70,
                ),
              ),
            ),
          ),

          // الدائرة المزخرفة
          Positioned(
            right: -30,
            top: -30,
            child: Container(
              height: 120.h,
              width: 120.w,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15), // لون فاتح شفاف
                borderRadius: BorderRadius.circular(100.r),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
