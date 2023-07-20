import 'package:get/get.dart';
import 'package:tashtari_admin/core/constant/routesname.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/services/services.dart';
import '../../core/function/handlingdata.dart';
import '../../data/datasource/remote/categoriesView_data.dart';
import '../../data/model/categories_model.dart';

class CatViewController extends GetxController {
  StatusRequest? statusRequest;
  CatViewData catViewData = CatViewData(Get.find());
  List<Categoriesmodel> catlist = [];

  MyServices myservices = Get.find();
}

class ImpCatViewController extends CatViewController {
  // ignore: non_constant_identifier_names

  getData() async {
    catlist.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await catViewData.getData();
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        print("done");
        List data = response["data"];
        catlist.addAll(data.map((e) => Categoriesmodel.fromJson(e)));
      } else {}
    }
    update();
  }

  deleteData(String? catid, String oldimage) {
    catViewData.deleteData(catid!, oldimage);
    catlist.removeWhere((element) => element.categoriesId == catid);
    update();
  }

  gotoEdit(Categoriesmodel categoriesmodel) {
    Get.toNamed(AppRoutes.categoriesEdit,
        arguments: {"model": categoriesmodel});
  }

  myback() {
    Get.offAllNamed(AppRoutes.homemain);
    return Future.value(false);
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
