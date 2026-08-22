import 'package:ecommerceapp21/view/screen/outh/orders/archiveOrder/archiveOrderController.dart';
import 'package:ecommerceapp21/view/widget/archivecart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArchiveOrder extends StatelessWidget {
  const ArchiveOrder({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ArchiveOrderController());
    return Scaffold(
      appBar: AppBar(title: Text("Order")),
      body: Container(
          padding: EdgeInsets.all(10),
          child: GetBuilder<ArchiveOrderController>(
            builder: (controller) => ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) => ArchiveCart(
                listdata: controller.data[index],
              ),
            ),
          )),
    );
  }
}
