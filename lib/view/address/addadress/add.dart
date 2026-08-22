import 'package:ecommerceapp21/core/const/colors.dart';
import 'package:ecommerceapp21/core/const/routes.dart';
import 'package:ecommerceapp21/view/address/addadress/addController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';

import 'package:latlong2/latlong.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    Addcontroller mapController = Get.put(Addcontroller());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a new address"),
        backgroundColor: Colors.teal,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.addressAdd);
        },
        child: Icon(Icons.add),
      ),
      body: Obx(
        () => Stack(
          alignment: Alignment.center,
          children: [
            FlutterMap(
              options: MapOptions(
                center: LatLng(33.5138, 36.2765), // دمشق مثال
                zoom: 13.0,
                onTap: (tapPosition, point) {
                  mapController.addMarker(point);
                },
              ),
              children: [
                TileLayer(
                  urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                  userAgentPackageName: 'com.example.myapp',
                ),
                MarkerLayer(
                  markers: mapController.markerList,
                ),
              ],
            ),
            Positioned(
                bottom: 10,
                child: Container(
                  child: MaterialButton(
                    onPressed: () {
                      mapController.gotopagePartTowAddrres();
                    },
                    color: AppColor.c2,
                    textColor: Colors.white,
                    child: Text(
                      "countune",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
