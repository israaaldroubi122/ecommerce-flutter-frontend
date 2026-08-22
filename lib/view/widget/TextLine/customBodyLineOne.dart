import 'package:ecommerceapp21/Style/appStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CstomBodyLineOne extends StatelessWidget {
  final String text;
  const CstomBodyLineOne({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 25.h),
      child: Center(
          child: Text(
        text,
        style: AppStyle.textLarge,
      )),
    );
  }
}
