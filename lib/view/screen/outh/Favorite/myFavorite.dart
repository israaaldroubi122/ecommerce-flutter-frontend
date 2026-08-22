import 'package:ecommerceapp21/core/class/handlingDataView.dart';
import 'package:ecommerceapp21/view/screen/outh/Favorite/myfavorite_controller.dart';
import 'package:ecommerceapp21/view/widget/myfavorite/myfavorite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteController());
    return Scaffold(
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: GetBuilder<MyFavoriteController>(
            builder: (controller) => ListView(
              children: [
                //  CustomAppBar(
                //  titelappbar: "Find Product",
                //   onPressedIcon: () {},
                //   onPressedSearch: () {},
                //  onPressedfavorite: () {
                //  Get.toNamed(AppRoutes.myfavorite);
                // },
                // ),
                SizedBox(
                  height: 20,
                ),
                HandlingDataView(
                    statusReqoust: controller.statusReqoust,
                    widget: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.data.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 0.7),
                      itemBuilder: (context, index) {
                        return CustomlistFavorite(
                          itemsmodel: controller.data[index],
                        );
                      },
                    )),
              ],
            ),
          )),
    );
  }
}
