import 'package:ecommerceapp21/core/const/colors.dart';
import 'package:flutter/material.dart';

class CustomBottonAppBar extends StatelessWidget {
  final void Function()? onPressed;
  final String textBotton;
  final IconData iconBotton;

  final bool? active;
  const CustomBottonAppBar(
      {super.key,
      this.onPressed,
      required this.textBotton,
      required this.iconBotton,
      required this.active});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconBotton,
            color: active == true ? AppColor.c2 : AppColor.textThree,
          ),
          Text(
            textBotton,
            style: TextStyle(
              color: active == true ? AppColor.c2 : AppColor.textThree,
            ),
          )
        ],
      ),
    );
  }
}
