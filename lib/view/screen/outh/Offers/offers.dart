import 'package:ecommerceapp21/controller/favorite_Controller.dart';
import 'package:ecommerceapp21/core/const/routes.dart';
import 'package:ecommerceapp21/view/screen/outh/HomePage/home.dart';
import 'package:ecommerceapp21/view/screen/outh/Offers/offers_conttroler.dart';
import 'package:ecommerceapp21/view/widget/customAppBar.dart';
import 'package:ecommerceapp21/view/widget/offers/customlistOffers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Offers extends StatelessWidget {
  const Offers({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Favoritecontroller());
    Get.put(OffersController());
    return GetBuilder<OffersController>(
        builder: (controller) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: ListView(
                children: [
                  CustomAppBar(
                    onChanged: (val) {
                      controller.checkSearch(val);
                    },
                    mycontroller: controller.search!,
                    titelappbar: "Find Product",
                    //  onPressedIcon: () {},
                    onPressedSearch: () {
                      controller.onsearchitems();
                    },
                    onPressedfavorite: () {
                      Get.toNamed(AppRoutes.myfavorite);
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  !controller.issearch
                      ? ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.data.length,
                          itemBuilder: (context, index) => CustomListoffers(
                              itemsmodel: controller.data[index]),
                        )
                      : ListItemsSearch(
                          listdataModel: controller.listdata,
                        )
                ],
              ),
            ));
  }
}
