import 'package:ecommerceapp21/view/screen/outh/orders/ordersDetails/orderdetailseController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    OrderDetailsController controller = Get.put(OrderDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("OrderDetails")),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ListView(
          children: [
            Card(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    Table(
                      children: [
                        TableRow(children: [
                          Text(
                            "Item",
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "QTY",
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "price",
                            textAlign: TextAlign.center,
                          )
                        ]),
                        ...List.generate(
                          controller.data.length,
                          (index) => TableRow(children: [
                            Text(
                              "${controller.data[index].itemsName}",
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "${controller.data[index].countitems}",
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "${controller.data[index].itemsPrice}",
                              textAlign: TextAlign.center,
                            )
                          ]),
                        ),
                      ],
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Text(
                        "Total price: ${controller.ordersModel.ordersTotalprice}",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Card(
              child: Container(
                child: ListTile(
                  title: Text(
                    "Shepping Address",
                  ),
                  subtitle: Text(
                      "${controller.ordersModel.addressCity}  ${controller.ordersModel.addressStreet}"),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Card(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                height: 300,
                width: double.infinity,
                child: FlutterMap(
                  options: MapOptions(
                    center: LatLng(33.5138, 36.2765), // دمشق مثال
                    zoom: 13.0,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                      userAgentPackageName: 'com.example.myapp',
                    ),
                    MarkerLayer(
                      markers: controller.markerList,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
