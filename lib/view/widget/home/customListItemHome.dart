import 'package:ecommerceapp21/Style/appStyle.dart';
import 'package:ecommerceapp21/core/const/colors.dart';
import 'package:ecommerceapp21/data/model/itemsModel.dart';
import 'package:ecommerceapp21/view/screen/outh/HomePage/homepage_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

class ListItemHome extends GetView<HomePageControllerImp> {
  const ListItemHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260, // رفعنا الطول عشان الكتابة تظهر تحت الصورة
      child: ListView.separated(
        itemCount: controller.items.length,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        separatorBuilder: (context, index) => SizedBox(width: 12.w),
        itemBuilder: (context, i) {
          return ItemsHome(
            itemsmodel: Itemsmodel.fromJson(controller.items[i]),
          );
        },
      ),
    );
  }
}

class ItemsHome extends GetView<HomePageControllerImp> {
  final Itemsmodel itemsmodel;
  const ItemsHome({super.key, required this.itemsmodel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        controller.gotopageProductdetails(itemsmodel);
      },
      child: Container(
        width: 160.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // صورة المنتج
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
              child: Image.asset(
                "assets/images/${itemsmodel.itemsImage}",
                height: 120.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            // محتوى المنتج (الاسم والوصف/السعر)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    itemsmodel.itemsName ?? "",
                    style: AppStyle.textcardone.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                      color: Colors.black87,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    itemsmodel.itemaDesc ?? "",
                    style: AppStyle.textcardone.copyWith(
                      fontSize: 12.sp,
                      color: Colors.grey[600],
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    "\$${itemsmodel.itemsPrice}", // إذا عندك سعر
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                      color: AppColor.c2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
