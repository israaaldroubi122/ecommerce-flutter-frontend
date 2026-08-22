import 'package:ecommerceapp21/controller/favorite_Controller.dart';
import 'package:ecommerceapp21/core/const/routes.dart';
import 'package:ecommerceapp21/data/model/itemsModel.dart';
import 'package:ecommerceapp21/view/screen/outh/HomePage/home.dart';
import 'package:ecommerceapp21/view/screen/outh/items/items_controller.dart';
import 'package:ecommerceapp21/view/widget/customAppBar.dart';
import 'package:ecommerceapp21/view/widget/items/custmcategoriesItems.dart';
import 'package:ecommerceapp21/view/widget/items/customListItem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller = Get.put(ItemsControllerImp());
    Favoritecontroller controllerfav = Get.put(Favoritecontroller());
    return Scaffold(
        body: Container(
            padding: const EdgeInsets.all(15),
            child: Container(
                child: !controller.issearch
                    ? GetBuilder<ItemsControllerImp>(
                        builder: (controller) => ListView(
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
                            const SizedBox(
                              height: 30,
                            ),
                            const ListCategoriesItems(),
                            GridView.builder(
                                shrinkWrap: true,
                                itemCount: controller.data.length,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 0.7),
                                itemBuilder: (BuildContext context, index) {
                                  controllerfav
                                          .isfavorite[controller.data[index]] =
                                      controller.data[index]["favorite"];
                                  return CustomListItem(
                                    // active: true,
                                    itemsmodel: Itemsmodel.fromJson(
                                        controller.data[index]),
                                  );
                                })
                          ],
                        ),
                      )
                    : ListItemsSearch(
                        listdataModel: controller.listdata,
                      ))));
  }
}
