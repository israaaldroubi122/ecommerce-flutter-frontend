import 'package:ecommerceapp21/Style/appStyle.dart';
import 'package:ecommerceapp21/core/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottonvaigationBar extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomBottonvaigationBar(
      {super.key, required this.text, this.onPressed});

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
        onPressed: onPressed,
        child: Text(
          text,
          style: AppStyle.textButton,
        ),
      ),
    );
  }
}
