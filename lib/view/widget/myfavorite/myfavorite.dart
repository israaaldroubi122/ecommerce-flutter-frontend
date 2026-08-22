import 'package:ecommerceapp21/Style/appStyle.dart';
import 'package:ecommerceapp21/core/const/colors.dart';
import 'package:ecommerceapp21/data/model/myfavoriteModel.dart';
import 'package:ecommerceapp21/view/screen/outh/Favorite/myfavorite_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomlistFavorite extends GetView<MyFavoriteController> {
  //final bool active;
  final MyfavoeiteModel itemsmodel;
  const CustomlistFavorite({
    super.key,
    required this.itemsmodel,
    //required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //  controller.gotopageProductdetails(itemsmodel);
      },
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: "assets/images/${itemsmodel.itemsImage}",
                child: Image.asset(
                  "assets/images/${itemsmodel.itemsImage}",
                  height: 95,
                  //fit: BoxFit.fill,
                ),
              ), //////
              //  Text(
              //    trnsleteDataBase(
              //      itemsmodel.categoriesNameAr, itemsmodel.categoriesName),
              //style: AppStyle.textThreeBlack),
              Text(
                "${itemsmodel.itemaDesc!}",
                style: AppStyle.bodyTthree,
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${itemsmodel.itemsPrice}\$",
                    style: AppStyle.textcardtow,
                  ),
                  /*  GetBuilder<Favoritecontroller>(
                      builder: (controller) => IconButton(
                          onPressed: () {
                            if (controller.isfavorite[itemsmodel.itemsId] ==
                                "1") {
                              controller.setfavorite(itemsmodel.itemsId, "0");
                              controller.removefavorite(itemsmodel.itemsId!);
                            } else {
                              controller.setfavorite(itemsmodel.itemsId, "1");
                              controller.addvaforite(itemsmodel.itemsId!);
                            }
                          },
                          icon: Icon(
                            controller.isfavorite[itemsmodel.itemsId] == "1"
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                            color: AppColor.c2,
                          )))*/
                  //icon: Icon(
                  //controller.isfavorite[itemsmodel.itemsId] == "1"
                  //   ? Icons.favorite
                  //     : Icons.favorite_border_outlined,
                  //   color: AppColor.c2,
                  //   )))

                  IconButton(
                      onPressed: () {
                        controller.deletFromFavorite(itemsmodel.favoritId!);
                      },
                      icon: Icon(
                        Icons.delete_outline_outlined,
                        color: AppColor.c2,
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
