import 'package:ecommerceapp21/Style/appStyle.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTitelHome extends StatelessWidget {
  final String titel;
  const CustomTitelHome({super.key, required this.titel});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 8.h),
        child: Text(titel, style: AppStyle.headLineOne));
  }
}
