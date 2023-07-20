import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../HandlingDataView.dart';
import '../../../controller/orders/ordersPrepareController.dart';
import '../../widget/customMyCheckoutText.dart';
import '../../widget/orders/prepare/customcardPending.dart';

class prepare extends StatelessWidget {
  const prepare({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Get.put(ImpordersprepareController());
    return Container(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 29.0),
            child: CustomMyCheckouutText(
              textname: "97".tr,
            ),
          ),
          SizedBox(
            height: size.height * 0.032,
          ),
          GetBuilder<ImpordersprepareController>(
              builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Column(
                    children: [
                      ...List.generate(
                          controller.orderslist.length,
                          (index) => Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: CustomcardPrepare(
                                  onapprove: () {
                                    controller.Approve(
                                        controller.orderslist[index].ordersId!,
                                        controller
                                            .orderslist[index].ordersUsersid!,
                                        controller
                                            .orderslist[index].ordersType!);
                                  },
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
