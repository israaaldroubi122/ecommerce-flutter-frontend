import 'package:ecommerceapp21/core/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainerStyleOne extends StatelessWidget {
  const CustomContainerStyleOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 0.4.sh,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [AppColor.colorsivenDark, AppColor.colorsivenLight])),
    );
  }
}
