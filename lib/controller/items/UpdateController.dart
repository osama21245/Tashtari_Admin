import 'dart:io';

import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tashtari_admin/core/constant/routesname.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/services/services.dart';
import '../../core/function/handlingdata.dart';
import '../../core/function/uploadfile.dart';
import '../../data/datasource/remote/categoriesView_data.dart';
import '../../data/datasource/remote/itemsUpdate_data.dart';
import '../../data/model/categories_model.dart';
import '../../data/model/item_model.dart';
import 'ViewController.dart';

abstract class ItemUpdateController extends GetxController {
  List<SelectedListItem> dropDownList = [];
  CatViewData catViewData = CatViewData(Get.find());
  List<Categoriesmodel> catlist = [];
  StatusRequest? statusRequest;
  ItemUpdateData itemUpdateData = ItemUpdateData(Get.find());
  late TextEditingController itemName;
  late TextEditingController itemNameAr;
  late TextEditingController description;
  late TextEditingController descriptionAr;
  late TextEditingController price;
  late TextEditingController discount;
  late TextEditingController count;
  Itemmodel? itemmodel;
  late TextEditingController dropdownname;
  late TextEditingController dropdownnameActivation;

  late TextEditingController dropdownid;
  late TextEditingController activation;

  late TextEditingController Catid;
  late TextEditingController Catname;

  MyServices myservices = Get.find();
  File? file;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
}

class ImpItemUpdateController extends ItemUpdateController {
  // ignore: non_constant_identifier_names

  chooseImageGallery() async {
    file = await fileuploadGallery(false);
    print(file);
    update();
  }

  chooseImageCamera() async {
    file = await imageuploadCamera();
    print(file);
    print("========================================");
    update();
  }

  chooseImage(Size size) {
    ShowBottomMenu(() => chooseImageCamera(), () => chooseImageGallery(), size);
    update();
  }

  getCatData() async {
    dropDownList.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await catViewData.getData();
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        print("done");
        List data = response["data"];
        catlist.addAll(data.map((e) => Categoriesmodel.fromJson(e)));
        for (int i = 0; i < data.length; i++) {
          dropDownList.add(SelectedListItem(
              name: catlist[i].categoriesName!,
              value: catlist[i].categoriesId));
        }
      } else {}
    }
    update();
  }

  UpdateData() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await itemUpdateData.edit(
          itemName.text,
          itemNameAr.text,
          description.text,
          descriptionAr.text,
          price.text,
          discount.text,
          count.text,
          dropdownid.text,
          itemmodel!.itemsImage!,
          itemmodel!.itemsId!,
          activation.text,
          file);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response["status"] == "success") {
          Get.offNamed(AppRoutes.itemview);
          ImpItemViewController viewController = Get.find();
          viewController.getData();
          update();
        } else {}
      }
      update();
    }
  }

  @override
  void onInit() {
    itemmodel = Get.arguments["modelItem"];
    itemName = TextEditingController();
    itemNameAr = TextEditingController();
    description = TextEditingController();
    descriptionAr = TextEditingController();
    price = TextEditingController();
    discount = TextEditingController();
    count = TextEditingController();
    dropdownname = TextEditingController();
    dropdownid = TextEditingController();
    Catid = TextEditingController();
    activation = TextEditingController();
    dropdownnameActivation = TextEditingController();
    print(itemmodel!.itemsId!);
    getCatData();
    Catname = TextEditingController();
    super.onInit();

    getCatData();
    itemName.text = itemmodel!.itemsName!;
    dropdownid.text = itemmodel!.itmesCat!;
    itemNameAr.text = itemmodel!.itemsNameAr!;
    description.text = itemmodel!.itemsDescriptiom!;
    descriptionAr.text = itemmodel!.itemsDecriptiomAr!;

    price.text = itemmodel!.itemsPrice!;

    discount.text = itemmodel!.itemsDiscount!;
    count.text = itemmodel!.itemsCount!;
    activation.text = itemmodel!.itemsActive!;

    super.onInit();
  }
}
