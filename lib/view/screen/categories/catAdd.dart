import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tashtari_admin/core/function/valid.dart';
import 'package:tashtari_admin/view/widget/item/CustomImageFrameSVG.dart';

import '../../../HandlingDataView.dart';
import '../../../controller/categories/AddController.dart';
import '../../../core/constant/color.dart';
import '../../../core/shared/custombutton.dart';
import '../../../core/shared/customtextform.dart';

class CatAdd extends StatelessWidget {
  const CatAdd({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Get.put(ImpCatAddController());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text(
            "Add Category",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: "PlayfairDisplay",
                fontSize: 25),
          ),
          backgroundColor: AppColor.primaryColor,
        ),
        body: GetBuilder<ImpCatAddController>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Padding(
                padding: const EdgeInsets.only(
                    top: 19.0, left: 18, right: 18, bottom: 0),
                child: Form(
                  key: controller.formstate,
                  child: ListView(
                    children: [
                      CustonTextForm(
                        mycontroller: controller.CatNameAr,
                        hinttext: "Category Name",
                        labeltext: "Arabic",
                        iconData: Icons.category,
                        valid: (val) {
                          return validinput(val!, 1, 100, "email");
                        },
                      ),
                      CustonTextForm(
                        mycontroller: controller.CatName,
                        hinttext: "Category Name",
                        labeltext: "English",
                        iconData: Icons.category,
                        valid: (val) {
                          return validinput(val!, 1, 100, "email");
                        },
                      ),
                      MaterialButton(
                        textColor: Colors.white,
                        color: controller.file != null
                            ? AppColor.thirdColor
                            : AppColor.primaryColor,
                        onPressed: () {
                          controller.chooseImage();
                        },
                        child: Text("Add Image"),
                      ),
                      CustomButtom(
                        text: "Add",
                        onPressed: () {
                          controller.addData();
                        },
                      ),
                      if (controller.file != null)
                        CustomImageFrameSVG(file: controller.file!, size: size)
                    ],
                  ),
                ),
              )),
        ));
  }
}
