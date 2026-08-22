import 'package:ecommerceapp21/Style/appStyle.dart';

import 'package:flutter/material.dart';

class CustomheadLineTow extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomheadLineTow({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: AppStyle.textThreeBlack,
      ),
    );
  }
}
