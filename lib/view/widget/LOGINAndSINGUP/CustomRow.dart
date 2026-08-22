import 'package:ecommerceapp21/Style/appStyle.dart';
import 'package:ecommerceapp21/core/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CostomRow extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final String textButton;
  const CostomRow(
      {super.key,
      required this.text,
      this.onPressed,
      required this.textButton});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          text,
          style: AppStyle.bodyTowWhite,
        ),
        MaterialButton(
          onPressed: onPressed,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 7.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: AppColor.colorBotton),
            child: Text(
              textButton,
              style: AppStyle.bodyTowWhite,
            ),
          ),
        ),
      ],
    );
  }
}
