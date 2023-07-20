import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tashtari_admin/core/constant/color.dart';
import 'package:tashtari_admin/core/constant/routesname.dart';

import '../../../controller/home/homeControoler.dart';
import '../../../core/shared/customExitDialog.dart';
import '../../widget/drawer/customDrawer.dart';
import '../../widget/home/customHomeCard.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    ImphomePageControoler controller = Get.put(ImphomePageControoler());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text(
            "Control Panel",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: "PlayfairDisplay",
                fontSize: 25),
          ),
          backgroundColor: AppColor.primaryColor,
        ),
        drawer: Drawer(child: CustomDrawer()),
        body: WillPopScope(
          onWillPop: () {
            CustomMyDefalutDialog();
            return Future.value(false);
          },
          child: ListView(
            children: [
              GridView.builder(
                  itemCount: controller.homeControlList.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, mainAxisExtent: 150),
                  itemBuilder: (context, index) => CustomHomeCard(
                        ontap: () {
                          controller.goto(controller.homeControlList[index]);
                        },
                        Textname: "${controller.homeControlList[index].Text}",
                        url: controller.homeControlList[index].image,
                        size: size,
                      ))
            ],
          ),
        ));
  }
}
