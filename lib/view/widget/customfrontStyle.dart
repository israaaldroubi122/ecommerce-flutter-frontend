import 'package:ecommerceapp21/core/const/colors.dart';

import 'package:flutter/widgets.dart';

class CustomFrondStylePage extends StatelessWidget {
  const CustomFrondStylePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.topCenter,
          colors: [
            AppColor.primarycolorTow,
            AppColor.c2,
          ],
        ),
      ),
    );
  }
}
