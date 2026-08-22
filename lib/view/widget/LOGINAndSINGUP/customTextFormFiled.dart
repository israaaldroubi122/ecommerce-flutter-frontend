import 'package:ecommerceapp21/Style/appStyle.dart';
import 'package:ecommerceapp21/core/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormFiled extends StatelessWidget {
  final String labelText;
  final String hintText;
  final IconData? icon;
  final String? Function(String?) valid;
  final TextEditingController? mycontroller;
  final bool isNumber;
  final bool? obscureText;
  final void Function()? onTapIcon;

  const CustomTextFormFiled(
      {super.key,
      required this.labelText,
      required this.hintText,
      required this.icon,
      required this.mycontroller,
      required this.valid,
      required this.isNumber,
      this.obscureText,
      this.onTapIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText == null || obscureText == false ? false : true,
      keyboardType: isNumber
          ? const TextInputType.numberWithOptions(decimal: true)
          : TextInputType.text,
      validator: valid,
      controller: mycontroller,
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 30),
          label: Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              child: Text(
                labelText,
                style: AppStyle.textThreegrow,
              )),
          suffixIcon: InkWell(
            onTap: onTapIcon,
            child: Icon(
              icon,
              color: AppColor.textThree,
            ),
          ),
          hintText: hintText,
          hintStyle: AppStyle.bodLineThree,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
  }
}
