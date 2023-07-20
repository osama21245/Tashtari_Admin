import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../HandlingDataView.dart';
import '../../../controller/orders/ordersOnthwayController.dart';
import '../../widget/customMyCheckoutText.dart';
import '../../widget/orders/ontheway/customCardOnTheWay.dart';

class OntheWay extends StatelessWidget {
  const OntheWay({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Get.put(ImpordersOntheWayController());
    return Container(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 29.0),
            child: CustomMyCheckouutText(
              textname: "96".tr,
            ),
          ),
          SizedBox(
            height: size.height * 0.032,
          ),
          GetBuilder<ImpordersOntheWayController>(
              builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Column(
                    children: [
                      ...List.generate(
                          controller.orderslist.length,
                          (index) => Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: CustomcardOnTheWay(
                                  size: size,
                                  orderModel: controller.orderslist[index],
                                ),
                              ))
                    ],
                  )))
        ],
      ),
    );
  }
}
