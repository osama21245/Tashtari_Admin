import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tashtari_admin/core/constant/routesname.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/services/services.dart';
import '../../core/function/handlingdata.dart';
import '../../core/function/uploadfile.dart';
import '../../data/datasource/remote/categoriesAdd_data.dart';
import '../../data/model/categories_model.dart';
import 'ViewController.dart';

abstract class CatAddController extends GetxController {
  StatusRequest? statusRequest;
  CatAddData catAddData = CatAddData(Get.find());
  List<Categoriesmodel> catlist = [];
  late TextEditingController CatName;
  late TextEditingController CatNameAr;
  MyServices myservices = Get.find();
  File? file;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
}

class ImpCatAddController extends CatAddController {
  // ignore: non_constant_identifier_names

  chooseImage() async {
    file = await fileuploadGallery(true);
    print(file);
    update();
  }

  addData() async {
    if (formstate.currentState!.validate()) {
      if (file != null) {
        statusRequest = StatusRequest.loading;
        update();
        var response =
            await catAddData.add(CatName.text, CatNameAr.text, file!);
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
      } else {
        Get.snackbar("Warning", "please Add a svg Photo");
      }
    }
  }

  @override
  void onInit() {
    CatName = TextEditingController();
    CatNameAr = TextEditingController();
    super.onInit();
  }
}
