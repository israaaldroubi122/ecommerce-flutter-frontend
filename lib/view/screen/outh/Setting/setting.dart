import 'package:ecommerceapp21/core/const/images.dart';
import 'package:ecommerceapp21/core/const/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:url_launcher/url_launcher.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              height: 70,
              color: Colors.black,
            ),
            Positioned(
              top: 19,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: CircleAvatar(
                  radius: 40.r,
                  backgroundImage: AssetImage(AssetsImages.dress),
                ),
              ),
            ),
          ],
        ),
        Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                // trailing: ,
                title: Text("Disable Notifications"),
              ),
              const Divider(),
              ListTile(
                onTap: () {
                  Get.toNamed(AppRoutes.addressView);
                },
                trailing: Icon(Icons.location_on_outlined),
                title: Text("address"),
              ),
              Divider(),
              ListTile(
                trailing: Icon(Icons.help_outline_rounded),
                title: Text("about us"),
              ),
              Divider(),
              ListTile(
                onTap: () {
                  launchUrl(Uri.parse("tel:0936717873"));
                },
                trailing: Icon(Icons.phone_callback_outlined),
                title: Text("connect us"),
              ),
              Divider(),
              ListTile(
                trailing: Icon(Icons.exit_to_app),
                title: Text("lagout"),
              ),
              Divider(),
              ListTile(
                onTap: () {
                  Get.toNamed(AppRoutes.pendingOrder);
                },
                trailing: const Icon(Icons.card_travel),
                title: const Text("Order"),
              ),
              Divider(),
              ListTile(
                onTap: () {
                  Get.toNamed(AppRoutes.archiveOrder);
                },
                trailing: Icon(Icons.card_travel),
                title: Text("archive"),
              ),
            ],
          ),
        )
      ],
    );
  }
}
