import 'package:cached_network_image/cached_network_image.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../HandlingDataView.dart';
import '../../../controller/items/UpdateController.dart';
import '../../../core/constant/color.dart';
import '../../../core/function/valid.dart';
import '../../../core/shared/customDropDown.dart';
import '../../../core/shared/custombutton.dart';
import '../../../core/shared/customtextform.dart';
import '../../widget/item/CustomImageFrame.dart';

class ItemUpdate extends StatelessWidget {
  const ItemUpdate({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ImpItemUpdateController controller = Get.put(ImpItemUpdateController());
    return Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(
            left: 23.0,
            bottom: 15,
            right: 23,
          ),
          child: CustomButtom(
            text: "Save",
            onPressed: () {
              controller.UpdateData();
            },
          ),
        ),
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text(
            "Update Item",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: "PlayfairDisplay",
                fontSize: 25),
          ),
          backgroundColor: AppColor.primaryColor,
        ),
        body: GetBuilder<ImpItemUpdateController>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Padding(
                padding: const EdgeInsets.only(
                    top: 25.0, left: 18, right: 18, bottom: 15),
                child: Form(
                  key: controller.formstate,
                  child: ListView(
                    children: [
                      CustonTextForm(
                        mycontroller: controller.itemName,
                        hinttext: "Item Name Arabic",
                        labeltext: "Item",
                        iconData: Icons.shopping_cart_outlined,
                        valid: (val) {
                          return validinput(val!, 1, 100, "email");
                        },
                      ),
                      CustonTextForm(
                        mycontroller: controller.itemNameAr,
                        hinttext: "Item Name English",
                        labeltext: "Item",
                        iconData: Icons.shopping_cart_outlined,
                        valid: (val) {
                          return validinput(val!, 1, 100, "email");
                        },
                      ),
                      CustonTextForm(
                        mycontroller: controller.description,
                        hinttext: "Description English",
                        labeltext: "Item",
                        iconData: Icons.shopping_cart_outlined,
                        valid: (val) {
                          return validinput(val!, 1, 100, "email");
                        },
                      ),
                      CustonTextForm(
                        mycontroller: controller.descriptionAr,
                        hinttext: "Description Arabic",
                        labeltext: "Item",
                        iconData: Icons.shopping_cart_outlined,
                        valid: (val) {
                          return validinput(val!, 1, 100, "email");
                        },
                      ),
                      CustonTextForm(
                        mycontroller: controller.price,
                        hinttext: "Price",
                        labeltext: "Item",
                        iconData: Icons.shopping_cart_outlined,
                        valid: (val) {
                          return validinput(val!, 1, 100, "email");
                        },
                      ),
                      CustonTextForm(
                        mycontroller: controller.count,
                        hinttext: "Count",
                        labeltext: "Item",
                        iconData: Icons.shopping_cart_outlined,
                        valid: (val) {
                          return validinput(val!, 1, 100, "email");
                        },
                      ),
                      CustonTextForm(
                        mycontroller: controller.discount,
                        hinttext: "Discount",
                        labeltext: "Item",
                        iconData: Icons.shopping_cart_outlined,
                        valid: (val) {
                          return validinput(val!, 1, 100, "email");
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: CustomdropDownList(
                            colorCard: AppColor.thirdColor,
                            dorpDownSelectedId: controller.dropdownid,
                            dorpDownSelectedName: controller.dropdownname,
                            title: "Choose Category",
                            Listdata: controller.dropDownList),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: CustomdropDownList(
                            colorCard: controller.itemmodel!.itemsActive! == "1"
                                ? AppColor.thirdColor
                                : const Color.fromARGB(255, 244, 54, 86),
                            dorpDownSelectedId: controller.activation,
                            dorpDownSelectedName:
                                controller.dropdownnameActivation,
                            title: "Activation",
                            Listdata: [
                              SelectedListItem(name: "ON", value: "1"),
                              SelectedListItem(name: "Off", value: "0")
                            ]),
                      ),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        padding: const EdgeInsets.symmetric(vertical: 13),
                        onPressed: () {
                          controller.chooseImage(size);
                        },
                        color: controller.file != null
                            ? AppColor.thirdColor
                            : AppColor.primaryColor,
                        textColor: Colors.white,
                        child: Text("Add Image",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                      ),
                      SizedBox(
                        height: size.height * 0.033,
                      ),
                      if (controller.file != null)
                        CustomImageFrame(url: controller.file!, size: size)
                    ],
                  ),
                ),
              )),
        ));
  }
}
