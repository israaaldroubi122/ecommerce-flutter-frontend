import 'package:ecommerceapp21/Style/appStyle.dart';
import 'package:flutter/material.dart';

class CustomCartListItem extends StatelessWidget {
  final String name;
  final String price;
  final String count;
  final String image;
  final void Function()? onPressedadd;
  final void Function()? onPressedremove;

  const CustomCartListItem(
      {super.key,
      required this.name,
      required this.price,
      required this.count,
      required this.onPressedadd,
      required this.onPressedremove,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Image.asset(image
                  //height: 30,
                  )),
          Expanded(
              flex: 3,
              child: ListTile(
                title: Text(
                  name,
                  style: AppStyle.left,
                ),
                subtitle: Text(
                  price,
                  style: AppStyle.textcardtow,
                ),
              )),
          Expanded(
              child: Column(
            children: [
              IconButton(onPressed: onPressedadd, icon: const Icon(Icons.add)),
              Text(
                count,
                style: AppStyle.textcardtow,
              ),
              IconButton(
                  onPressed: onPressedadd, icon: const Icon(Icons.remove))
            ],
          )),
        ],
      ),
    );
  }
}
