import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tashtari_admin/controller/users/usersController.dart';

import '../../HandlingDataView.dart';
import '../../core/constant/color.dart';
import '../../core/shared/customSearch.dart';
import '../widget/users/customSearchResult.dart';
import '../widget/users/customUsersCard.dart';

class Users extends StatelessWidget {
  const Users({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ImpUsersController controller = Get.put(ImpUsersController());
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20.0, right: 20),
            child: Customsearech(
              mycontroller: controller.searchvalue,
              onpressedsearch: () async {
                controller.onsearchitems();
                await controller.search();
              },
              onchange: (val) {
                controller.checkSearch(val);
              },
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 29.0),
          //   child: CustomMyCheckouutText(
          //     textname: "100".tr,
          //   ),
          // ),
          SizedBox(
            height: size.height * 0.032,
          ),
          GetBuilder<ImpUsersController>(
              builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Column(
                    children: [
                      ...List.generate(controller.userslist.length, (index) {
                        return controller.issearch == false
                            ? CustomUsersCard(
                                switchvalue: controller.userstatus[controller
                                            .userslist[index].usersId] ==
                                        "1"
                                    ? false
                                    : true,
                                userslist: controller.userslist[index],
                              )
                            : CustomsearchResult(
                                userslist: controller.userslist[index]);
                      })
                    ],
                  )))
        ],
      ),
    );
  }
}
