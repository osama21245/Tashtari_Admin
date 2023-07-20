import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tashtari_admin/core/constant/color.dart';
import 'package:get/get.dart';

import '../../../controller/orders/OrdersmainController.dart';
import '../../../controller/orders/ordersAcceptedController.dart';
import '../../../controller/orders/ordersOnthwayController.dart';
import '../../../controller/orders/ordersPrepareController.dart';

import '../../../controller/orders/ordersarchiveController.dart';
import '../../widget/homeMain/custombuttomAppbarHome.dart';

class Ordersmain extends StatelessWidget {
  const Ordersmain({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ImpOrdersmainController());
    ImpordersacceptedController controllerAccepted =
        Get.put(ImpordersacceptedController());
    ImpordersprepareController controllerpending =
        Get.put(ImpordersprepareController());
    ImpordersOntheWayController ControllerontheWay =
        Get.put(ImpordersOntheWayController());
    ImporderArchiveController controllerArchive =
        Get.put(ImporderArchiveController());
    return GetBuilder<ImpOrdersmainController>(
      builder: (controller) => Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColor.primaryColor,
            onPressed: () async {
              await controllerAccepted.refreshpage();
              await controllerpending.refreshpage();
              await ControllerontheWay.refreshpage();
              await controllerArchive.refreshpage();
            },
            child: Icon(Icons.refresh),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: const customBottomAppBarHome(),
          body: controller.listpage.elementAt(controller.currentpage)),
    );
  }
}
