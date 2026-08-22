import 'package:ecommerceapp21/core/const/routes.dart';
import 'package:get/get.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';

class Addcontroller extends GetxController {
  gotopagePartTowAddrres() {
    Get.toNamed(AppRoutes.addpartTowAddress,
        arguments: {"lat": lat.toString(), "long": long.toString()});
  }

  var markers = <Marker>[].obs;

  double? lat;
  double? long;

  addMarker(LatLng latlng) {
    markers.clear();
    markers.add(
      Marker(
        point: latlng,
        width: 60,
        height: 60,
        child: Icon(
          Icons.location_on,
          color: Colors.red,
          size: 40,
        ),
      ),
    );
    lat = latlng.latitude;
    long = latlng.latitude;
    update();
  }

  List<Marker> get markerList => markers.toList();
}
