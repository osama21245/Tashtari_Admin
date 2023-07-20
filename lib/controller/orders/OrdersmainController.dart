import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/screen/orders/accepted.dart';
import '../../view/screen/orders/archived.dart';
import '../../view/screen/orders/ontheway.dart';
import '../../view/screen/orders/prepare.dart';

// ignore: camel_case_types
abstract class OrdermainController extends GetxController {
  changePage(int currentpage);
}

class ImpOrdersmainController extends OrdermainController {
  int currentpage = 0;

  List<Widget> listpage = [
    const Accepted(),
    const prepare(),
    const OntheWay(),
    const Orderarchive()
  ];
  List titlebottomappbar = ["96".tr, "97".tr, "89".tr, "95".tr];

  List<IconData> iconbottomappbar = [
    Icons.done_all,
    Icons.message,
    Icons.delivery_dining_outlined,
    Icons.archive_outlined
  ];

  @override
  // ignore: avoid_renaming_method_parameters
  changePage(int i) {
    currentpage = i;

    update();
  }
}
