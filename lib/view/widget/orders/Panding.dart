import 'package:ecommerceapp21/Style/appStyle.dart';
import 'package:ecommerceapp21/core/const/colors.dart';
import 'package:ecommerceapp21/core/const/routes.dart';
import 'package:ecommerceapp21/data/model/ordersModel.dart';
import 'package:ecommerceapp21/view/screen/outh/orders/pandingorder/pendingOrderpending.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class Panding extends GetView<PendingOrderController> {
  final OrdersModel listdata;
  const Panding({super.key, required this.listdata});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Text(
                "Order Number: ${listdata.ordersId}",
                style: AppStyle.left,
              ),
              Spacer(),

              //  Text(listdata.ordersDatetime!)
              // ignore: unnecessary_string_interpolations
              Text("${Jiffy.parse(listdata.ordersDatetime!).fromNow()}")
            ],
          ),
          const Divider(),
          Text(
              "order Type:${controller.printTypeOrder(listdata.ordersType!)} "),
          Text("order Price: ${listdata.ordersPrice}\$"),
          Text("Delivary Price: ${listdata.ordersPricedelivery}\$"),
          Text(
              "Payment Methode: ${controller.printPaymentMethod(listdata.ordersPaymentmothod!)}"),
          Text(
              "Order Status: ${controller.prentOrderStatus(listdata.ordersStatus!)}"),
          const Divider(),
          Row(
            children: [
              Text(
                "Total Price : delvary",
                style: AppStyle.textcardtow,
              ),
              Spacer(),
              MaterialButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.orderDetails,
                      arguments: {"OrdersModel": listdata});
                },
                child: Text(
                  "details",
                  style: AppStyle.textThreegrow,
                ),
                color: AppColor.colorBotton,
              ),
              SizedBox(
                width: 10,
              ),
              if (listdata.ordersStatus == "0")
                MaterialButton(
                  onPressed: () {
                    controller.deletOrder(listdata.ordersId!);
                  },
                  child: Text(
                    "delete ",
                    style: AppStyle.textThreegrow,
                  ),
                  color: AppColor.colorBotton,
                )
            ],
          ),
        ]),
      ),
    );
  }
}
