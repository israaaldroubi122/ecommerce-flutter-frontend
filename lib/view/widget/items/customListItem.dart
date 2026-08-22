import 'package:ecommerceapp21/Style/appStyle.dart';
import 'package:ecommerceapp21/controller/favorite_Controller.dart';
import 'package:ecommerceapp21/core/const/colors.dart';
import 'package:ecommerceapp21/core/const/images.dart';
import 'package:ecommerceapp21/core/function/trnsletdatabase.dart';
import 'package:ecommerceapp21/data/model/itemsModel.dart';
import 'package:ecommerceapp21/view/screen/outh/items/items_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListItem extends GetView<ItemsControllerImp> {
  //final bool active;
  final Itemsmodel itemsmodel;
  const CustomListItem({
    super.key,
    required this.itemsmodel,
    //required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.gotopageProductdetails(itemsmodel);
      },
      child: Card(
        color: Colors.white,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(
                    tag: "assets/images/${itemsmodel.itemsImage}",
                    child: Image.asset(
                      "assets/images/${itemsmodel.itemsImage}",
                      height: 120,
                      fit: BoxFit.fill,
                    ),
                  ), //////
                  Text(
                      trnsleteDataBase(itemsmodel.categoriesNameAr,
                          itemsmodel.categoriesName),
                      style: AppStyle.textThreeBlack),

                  // Text(
                  //   "${itemsmodel.itemaDesc!}",
                  //   style: AppStyle.bodyTthree,
                  //   textAlign: TextAlign.center,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${itemsmodel.itemspricediscount}\$",
                        style: AppStyle.textcardtow,
                      ),
                      GetBuilder<Favoritecontroller>(
                          builder: (controller) => IconButton(
                              onPressed: () {
                                if (controller.isfavorite[itemsmodel.itemsId] ==
                                    "1") {
                                  controller.setfavorite(
                                      itemsmodel.itemsId, "0");
                                  controller
                                      .removefavorite(itemsmodel.itemsId!);
                                } else {
                                  controller.setfavorite(
                                      itemsmodel.itemsId, "1");
                                  controller.addvaforite(itemsmodel.itemsId!);
                                }
                              },
                              icon: Icon(
                                controller.isfavorite[itemsmodel.itemsId] == "1"
                                    ? Icons.favorite
                                    : Icons.favorite_border_outlined,
                                color: AppColor.c2,
                              )))
                    ],
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.star_rate,
                        color: AppColor.c2,
                      ),
                      Text(
                        "4.5",
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      const Icon(
                        Icons.timer_sharp,
                        color: Colors.grey,
                      ),
                      Text(
                        "${controller.delivaryTime} Mintue",
                        style: AppStyle.bodyTowBlack,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (itemsmodel.itemsDiscount != "0")
              Positioned(
                  top: 4,
                  left: 4,
                  child: Image.asset(
                    AssetsImages.sael,
                    width: 45,
                  ))
          ],
        ),
      ),
    );
  }
}
