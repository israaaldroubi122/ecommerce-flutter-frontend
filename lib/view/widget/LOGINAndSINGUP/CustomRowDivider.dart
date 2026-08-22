import 'package:ecommerceapp21/Style/appStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CstomRowDivider extends StatelessWidget {
  final String text;
  const CstomRowDivider({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: Colors.grey,
            thickness: 1,
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Text(
          text,
          style: AppStyle.bodLineThree,
        ),
        SizedBox(
          width: 10.w,
        ),
        const Expanded(
          child: Divider(
            color: Colors.grey,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
