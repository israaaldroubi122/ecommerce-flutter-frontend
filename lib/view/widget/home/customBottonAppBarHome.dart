import 'package:ecommerceapp21/core/const/colors.dart';
import 'package:ecommerceapp21/view/screen/homeScreen/homescreen_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CustomBttonAppBar extends StatelessWidget {
  const CustomBttonAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => Container(
        margin: const EdgeInsets.only(
            bottom: 5, left: 0, right: 00), // يرفعو عن أسفل الشاشة
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 103, 102, 102),
              blurRadius: 12,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ...List.generate(controller.listpage.length, (i) {
                  return GestureDetector(
                    onTap: () => controller.changePage(i),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      decoration: BoxDecoration(
                        color: controller.currentPage == i
                            ? AppColor.c4
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            controller.bottonAppBar[i]['icon'],
                            color: controller.currentPage == i
                                ? Colors.white
                                : Colors.grey,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            controller.bottonAppBar[i]['title'],
                            style: TextStyle(
                              color: controller.currentPage == i
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
