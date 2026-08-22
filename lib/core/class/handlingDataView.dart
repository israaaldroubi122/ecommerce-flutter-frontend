import 'package:ecommerceapp21/core/class/statusReqoust.dart';
import 'package:flutter/material.dart';

class HandlingDataView extends StatelessWidget {
  final StatusReqoust statusReqoust;
  final Widget widget;
  const HandlingDataView({
    super.key,
    required this.statusReqoust,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return statusReqoust == StatusReqoust.loading
        ? const Center(child: Text("Loading"))
        : statusReqoust == StatusReqoust.offlinefailure
            ? const Center(child: Text("offlinefailure"))
            : statusReqoust == StatusReqoust.serverfailure
                ? const Center(child: Text("serverfailure"))
                : statusReqoust == StatusReqoust.failure
                    ? const Center(child: Text("Nodata"))
                    : widget;
  }
}
