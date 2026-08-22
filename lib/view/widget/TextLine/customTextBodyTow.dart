import 'package:ecommerceapp21/Style/appStyle.dart';
import 'package:flutter/material.dart';

class CustomBodyTow extends StatelessWidget {
  final String text;
  const CustomBodyTow({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppStyle.headLinelarg,
    );
  }
}
