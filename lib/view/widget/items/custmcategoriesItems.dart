import 'package:ecommerceapp21/Style/appStyle.dart';
import 'package:ecommerceapp21/core/const/colors.dart';
import 'package:ecommerceapp21/core/function/trnsletdatabase.dart';
import 'package:ecommerceapp21/data/model/categoriesModel.dart';
import 'package:ecommerceapp21/view/screen/outh/items/items_controller.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ListCategoriesItems extends GetView<ItemsControllerImp> {
  const ListCategoriesItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
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

class Categories extends GetView<ItemsControllerImp> {
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
      onTap: () {
        //controller.gotoItem(controller.categories, i!);
        controller.changCat(i!, categoriesmodel.categoriesId!);
      },
      child: Column(
        children: [
          GetBuilder<ItemsControllerImp>(
              builder: (controller) => Container(
                  padding:
                      const EdgeInsets.only(right: 10, left: 10, bottom: 5),
                  decoration: controller.selectedCat == i
                      ? const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(width: 3, color: AppColor.c2)))
                      : null,
                  child: Text(
                      "${trnsleteDataBase(categoriesmodel.categoriesNameAr, categoriesmodel.categoriesName)}",
                      style: AppStyle.textGrey)))
        ],
      ),
    );
  }
}
