import 'package:ecommerceapp21/Style/appStyle.dart';
import 'package:flutter/material.dart';

class CustomheadLineOne extends StatelessWidget {
  final String text;
  const CustomheadLineOne({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppStyle.bodLineThree,
    );
  }
}
