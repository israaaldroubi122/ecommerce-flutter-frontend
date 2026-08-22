import 'package:ecommerceapp21/view/screen/outh/orders/pandingorder/pendingOrderpending.dart';
import 'package:ecommerceapp21/view/widget/orders/Panding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PendingOrder extends StatelessWidget {
  const PendingOrder({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PendingOrderController());
    return Scaffold(
      appBar: AppBar(title: Text("Order")),
      body: Container(
          padding: EdgeInsets.all(10),
          child: GetBuilder<PendingOrderController>(
            builder: (controller) => ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) => Panding(
                listdata: controller.data[index],
              ),
            ),
          )),
    );
  }
}
