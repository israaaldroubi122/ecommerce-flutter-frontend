import 'package:ecommerceapp21/Style/appStyle.dart';
import 'package:ecommerceapp21/core/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Custom extends StatelessWidget {
  final String text;
  final IconData? icon;
  const Custom({super.key, required this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColor.textThree),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Row(
          children: [
            Icon(
              icon,
              color: AppColor.colorsivenDark,
            ),
            SizedBox(width: 5.h),
            Text(
              text,
              style: AppStyle.textThreeBlack,
            )
          ],
        ),
      ),
    );
  }
}
