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
import '../../data/datasource/remote/itemsAdd_data.dart';
import '../../data/model/categories_model.dart';
import 'ViewController.dart';

abstract class ItemAddController extends GetxController {
  List<SelectedListItem> dropDownList = [];

  StatusRequest? statusRequest;
  ItemAddData itemAddData = ItemAddData(Get.find());
  late TextEditingController itemName;
  late TextEditingController itemNameAr;
  late TextEditingController description;
  late TextEditingController descriptionAr;
  late TextEditingController price;
  late TextEditingController discount;
  late TextEditingController count;
  MyServices myservices = Get.find();
  CatViewData catViewData = CatViewData(Get.find());
  List<Categoriesmodel> catlist = [];
  late TextEditingController dropdownname;
  late TextEditingController dropdownid;
  late TextEditingController Catid;
  late TextEditingController Catname;

  File? file;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
}

class ImpItemAddController extends ItemAddController {
  // ignore: non_constant_identifier_names

  chooseImageGallery() async {
    file = await fileuploadGallery(false);
    print(file);
    update();
  }

  chooseImageCamera() async {
    file = await imageuploadCamera();
    print(file);
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

  addData() async {
    if (formstate.currentState!.validate()) {
      if (file != null) {
        statusRequest = StatusRequest.loading;
        update();
        var response = await itemAddData.add(
            itemName.text,
            itemNameAr.text,
            description.text,
            descriptionAr.text,
            price.text,
            discount.text,
            count.text,
            dropdownid.text,
            file!);
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
      } else {
        Get.snackbar("Warning", "please Add a svg Photo");
      }
    }
  }

  @override
  void onInit() {
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
    getCatData();
    Catname = TextEditingController();
    super.onInit();
  }
}
