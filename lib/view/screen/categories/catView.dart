import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tashtari_admin/HandlingDataView.dart';
import 'package:tashtari_admin/core/constant/routesname.dart';
import 'package:tashtari_admin/core/function/databaseTranslate.dart';

import '../../../controller/categories/ViewController.dart';
import '../../../core/constant/color.dart';
import '../../../linksApi.dart';

class CatView extends StatelessWidget {
  const CatView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Get.put(ImpCatViewController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.primaryColor,
        onPressed: () {
          Get.toNamed(AppRoutes.categoriesAdd);
        },
        child: Icon(
          Icons.add,
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Categories",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "PlayfairDisplay",
              fontSize: 25),
        ),
        backgroundColor: AppColor.primaryColor,
      ),
      body: GetBuilder<ImpCatViewController>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: WillPopScope(
                onWillPop: () {
                  return controller.myback();
                },
                child: ListView.builder(
                  itemCount: controller.catlist.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      controller.gotoEdit(controller.catlist[index]);
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
                                    "Are You sure you want to Delete this category"
                                        .tr,
                                onConfirm: () {
                                  controller.deleteData(
                                      controller.catlist[index].categoriesId,
                                      controller
                                          .catlist[index].categoriesImage!);
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
                        leading: SvgPicture.network(
                          "${Apilinks.linkimageCategories}/${controller.catlist[index].categoriesImage}",
                          width: size.width * 0.1,
                        ),
                        subtitle: Text(
                            "${controller.catlist[index].categoriesDatetime}"),
                        title: databaseTranslate(
                            Text(
                                "${controller.catlist[index].categoriesNameAr}"),
                            Text(
                                "${controller.catlist[index].categoriesName}")),
                      ),
                    ),
                  ),
                ),
              ))),
    );
  }
}
