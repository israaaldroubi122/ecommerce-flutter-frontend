import 'package:ecommerceapp21/core/const/images.dart';
import 'package:ecommerceapp21/core/const/routes.dart';
import 'package:ecommerceapp21/data/model/itemsModel.dart';
import 'package:ecommerceapp21/view/widget/home/customListItemHome.dart';
import 'package:ecommerceapp21/view/widget/home/customcardHome.dart';
import 'package:ecommerceapp21/view/screen/outh/HomePage/homepage_controller.dart';
import 'package:ecommerceapp21/view/widget/customAppBar.dart';
import 'package:ecommerceapp21/view/widget/home/customlistCategoreis.dart';
import 'package:ecommerceapp21/view/widget/home/customtitelhome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageControllerImp());

    return GetBuilder<HomePageControllerImp>(
      builder: (controller) => Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
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
                !controller.issearch
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //  if (controller.settingdata.isNotEmpty)
                          CustomCardHome(
                            title: "${controller.titelHomeCard}",
                            body: "${controller.bodyHomeCard}",
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          const CustomTitelHome(
                            titel: "Categories",
                          ),
                          SizedBox(
                            height: 7.h,
                          ),
                          const ListCategoriesHome(),
                          SizedBox(
                            height: 10.h,
                          ),
                          const CustomTitelHome(
                            titel: "Top Selling",
                          ),
                          const ListItemHome(),
                          SizedBox(
                            height: 15.h,
                          ),
                        ],
                      )
                    : ListItemsSearch(
                        listdataModel: controller.listdata,
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ListItemsSearch extends GetView<HomePageControllerImp> {
  final List<Itemsmodel> listdataModel;
  const ListItemsSearch({super.key, required this.listdataModel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: listdataModel.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              controller.gotopageProductdetails(listdataModel[index]);
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 20.h),
              child: Card(
                  child: Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child: Image.asset(AssetsImages.camera),
                    ),
                    Expanded(
                        flex: 2,
                        child: ListTile(
                          title: Text(listdataModel[index].itemsName!),
                          subtitle: Text(listdataModel[index].categoriesName!),
                        )),
                  ],
                ),
              )),
            ),
          );
        });
  }
}
