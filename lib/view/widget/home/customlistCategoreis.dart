import 'package:ecommerceapp21/Style/appStyle.dart';
import 'package:ecommerceapp21/core/function/trnsletdatabase.dart';
import 'package:ecommerceapp21/data/model/categoriesModel.dart';
import 'package:ecommerceapp21/view/screen/outh/HomePage/homepage_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ListCategoriesHome extends GetView<HomePageControllerImp> {
  const ListCategoriesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130.h,
      child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(
                width: 10.w,
              ),
          itemCount: controller.categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Categories(
              i: index,
              categoriesmodel:
                  Categoriesmodel.fromJson(controller.categories[index]),
            );
          }),
    );
  }
}

class Categories extends GetView<HomePageControllerImp> {
  final Categoriesmodel categoriesmodel;
  final int? i;
  const Categories({
    super.key,
    required this.categoriesmodel,
    this.i,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        controller.gotoItem(
            controller.categories, i!, categoriesmodel.categoriesId!);
      },
      child: Container(
        // width: 90.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: EdgeInsets.all(10.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // الصورة داخل خلفية متدرجة الألوان
            Container(
              height: 65.h,
              width: 65.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF7B42F6), // موف غامق
                    Color(0xFFB01EFF), // بنفسجي
                    Color(0xFFE86FFF), // زهري
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  "assets/images/${categoriesmodel.categoriesImage}",
                  fit: BoxFit.contain,
                  //    color: Colors.white, // يخلي الأيقونة واضحة فوق التدرج
                ),
              ),
            ),
            SizedBox(height: 10.h),
            // النص
            Text(
              trnsleteDataBase(
                categoriesmodel.categoriesNameAr,
                categoriesmodel.categoriesName,
              ),
              style: AppStyle.textcardone.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
                color: Colors.black87,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
