import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tashtari_admin/core/constant/services/services.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/imgaeasset.dart';
import '../../core/constant/routesname.dart';
import '../../data/model/home_model.dart';

abstract class homePageControoler extends GetxController {
  StatusRequest? statusRequest;

  bool issearch = false;

  String? langselected;
  MyServices myservices = Get.find();
  String? phone;
  String? email;
  String? name;

  String? id;
}

class ImphomePageControoler extends homePageControoler {
  goto(homelist homelist) {
    if (homelist.Text == "Categories") {
      Get.toNamed(AppRoutes.categoriesView);
    } else if (homelist.Text == "Items") {
      Get.toNamed(AppRoutes.itemview);
    } else if (homelist.Text == "Orders") {
      Get.toNamed(AppRoutes.Ordersmain);
    } else if (homelist.Text == "Notification") {
      Get.toNamed(AppRoutes.Notifications);
    } else if (homelist.Text == "Reports") {
      Get.toNamed(AppRoutes.Orderarchive);
    } else if (homelist.Text == "Users") {
      Get.toNamed(AppRoutes.users);
    }
  }

  List<homelist> homeControlList = [
    homelist(AppImageAsset.categories, "Categories"),
    homelist(AppImageAsset.items, "Items"),
    homelist(AppImageAsset.users, "Users"),
    homelist(AppImageAsset.reports, "Reports"),
    homelist(AppImageAsset.orders, "Orders"),
    homelist(AppImageAsset.notfications, "Notification")
  ];
  @override
  void onInit() {
    id = myservices.sharedPreferences.getString("id");
    email = myservices.sharedPreferences.getString("email");
    name = myservices.sharedPreferences.getString("name");
    phone = myservices.sharedPreferences.getString("phone");
    String? userid = myservices.sharedPreferences.getString("id");
    FirebaseMessaging.instance.subscribeToTopic("admin");
    FirebaseMessaging.instance.subscribeToTopic("admin${userid}");

    langselected = myservices.sharedPreferences.getString("lang");
    super.onInit();
  }
}
