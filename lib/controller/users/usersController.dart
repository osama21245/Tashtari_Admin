import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/services/services.dart';
import '../../core/function/handlingdata.dart';
import '../../data/datasource/remote/users_data.dart';
import '../../data/model/users_model.dart';

class UsersController extends GetxController {
  Map userstatus = {};
  bool issearch = false;
  List<UsersModel> searchlist = [];
  StatusRequest? statusRequest;
  UsersData usersData = UsersData(Get.find());
  List<UsersModel> userslist = [];
  late TextEditingController searchvalue;

  MyServices myservices = Get.find();
}

class ImpUsersController extends UsersController {
  // ignore: non_constant_identifier_names
  checkSearch(String val) {
    if (val == "") {
      issearch = false;
      statusRequest = StatusRequest.success;
      searchlist.clear();
    }
    update();
  }

  onsearchitems() {
    issearch = true;
    update();
  }

  setusersstatus(id, val) {
    userstatus[id] = val;
    update();
  }

  getData() async {
    userslist.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await usersData.getdata();
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        print("done");
        List data = response["data"];
        userslist.addAll(data.map((e) => UsersModel.fromJson(e)));
      } else {}
    }
    update();
  }

  changeuserStatus(
    String? userid,
    String userstatus,
  ) async {
    var response = await usersData.changeUserStatus(userstatus, userid!);
    if (response["status"] == "success") {
      Get.snackbar("Done", "");
    } else {
      Get.snackbar("Problem", "message");
    }

    update();
  }

  changeAdminStatus(
    String? userid,
    String userstatusResponse,
  ) async {
    var response = await usersData.changeAdminStatus(
      userstatusResponse,
      userid!,
    );
    if (response["status"] == "success") {
      userstatus[userid] == "3"
          ? Get.snackbar("Success", "You remove admin from User ${userid}")
          : Get.snackbar("Success", "User ${userid} Become a Admin");
      update();
    } else {
      Get.snackbar("Problem", "message");
    }
    update();
  }

  search() async {
    statusRequest = StatusRequest.loading;
    var response = await usersData.search(searchvalue.text);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        searchlist.clear();
        List searchresponse = response["data"];
        searchlist.addAll(searchresponse.map((e) => UsersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() async {
    searchvalue = TextEditingController();
    await getData();

    for (int i = 0; i < userslist.length; i++) {
      userstatus[userslist[i].usersId] = userslist[i].usersApprove;
    }

    print(userstatus);

    super.onInit();
  }
}
