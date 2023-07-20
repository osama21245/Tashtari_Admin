import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tashtari_admin/HandlingDataView.dart';
import 'package:tashtari_admin/core/constant/routesname.dart';
import 'package:tashtari_admin/core/function/databaseTranslate.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../controller/items/ViewController.dart';
import '../../../core/constant/color.dart';
import '../../../linksApi.dart';

class ItemView extends StatelessWidget {
  const ItemView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Get.put(ImpItemViewController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.primaryColor,
        onPressed: () {
          Get.toNamed(AppRoutes.itemAdd);
        },
        child: Icon(
          Icons.add,
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Items",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "PlayfairDisplay",
              fontSize: 25),
        ),
        backgroundColor: AppColor.primaryColor,
      ),
      body: GetBuilder<ImpItemViewController>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: WillPopScope(
                onWillPop: () {
                  return controller.myback();
                },
                child: ListView.builder(
                  itemCount: controller.itemlist.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      controller.gotoEdit(controller.itemlist[index]);
                    },
                    child: Card(
                      child: ListTile(
                        trailing: IconButton(
                          icon: Icon(Icons.delete_outline),
                          color: Color.fromARGB(255, 245, 97, 97),
                          onPressed: () {
                            Get.defaultDialog(
                                title: "Warning",
                                middleText:
                                    "Are You sure you want to Delete this Item"
                                        .tr,
                                onConfirm: () {
                                  controller.deleteData(
                                      controller.itemlist[index].itemsId,
                                      controller.itemlist[index].itemsImage!);
                                  Get.back();
                                },
                                onCancel: () {},
                                buttonColor: AppColor.primaryColor,
                                confirmTextColor: Colors.white,
                                cancelTextColor: AppColor.primaryColor,
                                textConfirm: "48".tr,
                                textCancel: "49".tr);
                          },
                        ),
                        leading: CachedNetworkImage(
                          imageUrl:
                              "${Apilinks.linkimageItems}/${controller.itemlist[index].itemsImage}",
                          width: size.width * 0.1,
                        ),
                        subtitle:
                            Text("${controller.itemlist[index].itemsDate}"),
                        title: databaseTranslate(
                            Text("${controller.itemlist[index].itemsNameAr}"),
                            Text("${controller.itemlist[index].itemsName}")),
                      ),
                    ),
                  ),
                ),
              ))),
    );
  }
}
