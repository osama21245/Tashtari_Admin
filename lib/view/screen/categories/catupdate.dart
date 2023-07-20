import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../HandlingDataView.dart';
import '../../../controller/categories/UpdateController.dart';
import '../../../core/constant/color.dart';
import '../../../core/function/valid.dart';
import '../../../core/shared/custombutton.dart';
import '../../../core/shared/customtextform.dart';
import '../../widget/item/CustomImageFrameSVG.dart';

class CatUpdate extends StatelessWidget {
  const CatUpdate({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Get.put(ImpCatUpdateController());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text(
            "Edit Category",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: "PlayfairDisplay",
                fontSize: 25),
          ),
          backgroundColor: AppColor.primaryColor,
        ),
        body: GetBuilder<ImpCatUpdateController>(
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
                        hinttext: "Category",
                        labeltext: "Arabic",
                        iconData: Icons.category,
                        valid: (val) {
                          return validinput(val!, 1, 100, "email");
                        },
                      ),
                      CustonTextForm(
                        mycontroller: controller.CatName,
                        hinttext: "Category",
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
                        child: Text("Edit Image"),
                      ),
                      CustomButtom(
                        text: "Save",
                        onPressed: () {
                          controller.UpdateData();
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
