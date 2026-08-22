import 'package:ecommerceapp21/core/class/handlingDataView.dart';
import 'package:ecommerceapp21/core/const/routes.dart';
import 'package:ecommerceapp21/data/model/addressModel.dart';
import 'package:ecommerceapp21/view/address/view/viewcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddressController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("address"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(AppRoutes.addressAdd);
          },
          child: Icon(Icons.add),
        ),
        body: GetBuilder<AddressController>(
            builder: (controller) => HandlingDataView(
                  statusReqoust: controller.statusReqoust,
                  widget: Container(
                    child: ListView.builder(
                      itemCount: controller.data.length,
                      itemBuilder: (context, i) {
                        return CardAddress(
                          addressModel: controller.data[i],
                          onPressed: () {
                            controller
                                .deletAddress(controller.data[i].addressId!);
                          },
                        );
                      },
                    ),
                  ),
                )));
  }
}

class CardAddress extends StatelessWidget {
  final AddressModel addressModel;
  final void Function()? onPressed;
  const CardAddress(
      {super.key, required this.addressModel, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
      padding: EdgeInsets.all(10),
      child: ListTile(
        title: Text(addressModel.addressName!),
        subtitle:
            Text("${addressModel.addressCity}  ${addressModel.addressStreet}"),
        trailing:
            IconButton(onPressed: onPressed, icon: Icon(Icons.delete_outline)),
      ),
    ));
  }
}
