import 'package:ecommerceapp21/Style/appStyle.dart';
import 'package:ecommerceapp21/core/const/colors.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  final String titelappbar;
  final void Function()? onPressedSearch;
  final void Function()? onPressedfavorite;
  final Function(String)? onChanged;
  final TextEditingController mycontroller;

  const CustomAppBar({
    super.key,
    required this.titelappbar,
    this.onPressedSearch,
    required this.onPressedfavorite,
    this.onChanged,
    required this.mycontroller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.c3, // بنفسجي فاتح (من ألوانك)
                borderRadius: BorderRadius.circular(30.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.c2.withOpacity(0.05),
                    blurRadius: 7,
                    offset: const Offset(0, 14),
                  )
                ],
              ),
              child: TextFormField(
                controller: mycontroller,
                onChanged: onChanged,
                decoration: InputDecoration(
                  prefixIcon: IconButton(
                    onPressed: onPressedSearch,
                    icon: const Icon(Icons.search),
                  ),
                  iconColor: Colors.grey[700],
                  hintText: titelappbar,
                  hintStyle: AppStyle.bodyOne.copyWith(color: Colors.grey[600]),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  filled: true,
                  fillColor: Colors.transparent,
                ),
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Container(
            decoration: BoxDecoration(
              color: AppColor.c2,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColor.c2.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: IconButton(
              onPressed: onPressedfavorite,
              icon: Icon(
                Icons.favorite,
                size: 28.w,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
