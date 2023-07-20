import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tashtari_admin/core/constant/routesname.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/services/services.dart';
import '../../core/function/handlingdata.dart';
import '../../core/function/uploadfile.dart';
import '../../data/datasource/remote/categoriesUpdate_data.dart';
import '../../data/model/categories_model.dart';
import 'ViewController.dart';

abstract class CatUpdateController extends GetxController {
  StatusRequest? statusRequest;
  CatUpdateData catEditData = CatUpdateData(Get.find());
  List<Categoriesmodel> catlist = [];
  late TextEditingController CatName;
  Categoriesmodel? categoriesmodel;
  late TextEditingController CatNameAr;
  MyServices myservices = Get.find();
  File? file;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
}

class ImpCatUpdateController extends CatUpdateController {
  // ignore: non_constant_identifier_names

  chooseImage() async {
    file = await fileuploadGallery(true);
    print(file);
    update();
  }

  UpdateData() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await catEditData.edit(
          CatName.text,
          CatNameAr.text,
          categoriesmodel!.categoriesId!,
          categoriesmodel!.categoriesImage!,
          file);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response["status"] == "success") {
          Get.offNamed(AppRoutes.categoriesView);
          ImpCatViewController viewController = Get.find();
          viewController.getData();
          update();
        } else {}
      }
      update();
    }
  }

  @override
  void onInit() {
    categoriesmodel = Get.arguments["model"];
    CatName = TextEditingController();
    CatNameAr = TextEditingController();
    CatName.text = categoriesmodel!.categoriesName!;
    CatNameAr.text = categoriesmodel!.categoriesNameAr!;
    super.onInit();
  }
}
