import 'package:ecommerceapp21/Style/appStyle.dart';
import 'package:ecommerceapp21/core/const/colors.dart';
import 'package:flutter/material.dart';

class CardDelivaryTypeCheckOut extends StatelessWidget {
  final String titel;
  final bool isActive;
  final String imageName;
  const CardDelivaryTypeCheckOut(
      {super.key,
      required this.titel,
      required this.isActive,
      required this.imageName});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
          color: isActive == true ? AppColor.c2 : null,
          border: Border.all(color: AppColor.c2)),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(
          imageName,
          width: 60,
          // color: isActive == true ? AppColor.c2 : null,
        ),
        Text(
          titel,
          style: isActive == true ? AppStyle.textcardtow : null,
        )
      ]),
    );
  }
}
