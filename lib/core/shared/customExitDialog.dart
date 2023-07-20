import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/color.dart';

CustomMyDefalutDialog() {
  Get.defaultDialog(
      title: "46".tr,
      middleText: "47".tr,
      onConfirm: () {
        exit(0);
      },
      onCancel: () {},
      buttonColor: AppColor.primaryColor,
      confirmTextColor: Colors.white,
      cancelTextColor: AppColor.primaryColor,
      textConfirm: "48".tr,
      textCancel: "49".tr);
}
