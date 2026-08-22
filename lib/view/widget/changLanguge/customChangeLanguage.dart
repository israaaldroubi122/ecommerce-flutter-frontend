import 'package:ecommerceapp21/core/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomChangeLanguage extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const CustomChangeLanguage({super.key, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 80.w),
      width: double.infinity,
      child: MaterialButton(
        textColor: Colors.white,
        color: AppColor.colorTowDark,
        onPressed: onPressed,
        child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}
