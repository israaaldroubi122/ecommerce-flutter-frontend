import 'package:ecommerceapp21/controller/testcontroller.dart';
import 'package:ecommerceapp21/core/class/handlingDataView.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Testcontroller());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Titel"),
      ),
      body: GetBuilder<Testcontroller>(builder: (controller) {
        return HandlingDataView(
            statusReqoust: controller.statusReqoust,
            widget: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                  return Text("${controller.data}");
                }));
      }),
    );
  }
}
