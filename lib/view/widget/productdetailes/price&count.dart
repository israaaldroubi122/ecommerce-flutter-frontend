import 'package:ecommerceapp21/Style/appStyle.dart';
import 'package:flutter/material.dart';

class PriceandCountItems extends StatelessWidget {
  final String count;
  final String price;
  final void Function()? onPressedAdd;
  final void Function()? onPressedremove;
  const PriceandCountItems(
      {super.key,
      required this.count,
      required this.price,
      this.onPressedAdd,
      this.onPressedremove});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: onPressedAdd, icon: const Icon(Icons.add)),
        Container(
          padding: const EdgeInsets.only(bottom: 6, top: 6),
          width: 50,
          //  height: 50,

          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.black)),
          child: Text(
            count,
            style: AppStyle.textcardtow,
          ),
        ),
        IconButton(onPressed: onPressedremove, icon: const Icon(Icons.remove)),
        const Spacer(),
        Text(
          price,
          style: AppStyle.textcardtow2,
        ),
      ],
    );
  }
}
