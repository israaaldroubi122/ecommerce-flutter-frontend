import 'package:ecommerceapp21/Style/appStyle.dart';
import 'package:ecommerceapp21/core/const/colors.dart';
import 'package:flutter/material.dart';

class CardAddressCheckOut extends StatelessWidget {
  final String titel;
  final String body;
  final bool isActive;
  const CardAddressCheckOut(
      {super.key,
      required this.titel,
      required this.body,
      required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isActive == true ? AppColor.c2 : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text(
          titel,
          style: isActive == true ? AppStyle.bodyTowWhitetow : null,
        ),
        subtitle: Text(
          body,
          style: isActive == true ? AppStyle.bodyTowWhitetow : null,
        ),
      ),
    );
  }
}
