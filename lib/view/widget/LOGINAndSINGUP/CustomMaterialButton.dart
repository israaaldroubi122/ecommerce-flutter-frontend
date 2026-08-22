import 'package:ecommerceapp21/Style/appStyle.dart';
import 'package:ecommerceapp21/core/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CstomMaterialButtom extends StatelessWidget {
  final String textButton;
  final void Function()? onPressed;
  const CstomMaterialButtom(
      {super.key, required this.textButton, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            gradient: const LinearGradient(
                colors: [AppColor.colorsivenDark, AppColor.colorSiven]),
            borderRadius: BorderRadius.circular(10.r)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 127, vertical: 12),
          child: Text(
            textButton,
            style: AppStyle.textButton,
          ),
        ),
      ),
    );
  }
}
