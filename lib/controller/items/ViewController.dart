import 'package:get/get.dart';
import 'package:tashtari_admin/core/constant/routesname.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/services/services.dart';
import '../../core/function/handlingdata.dart';
import '../../data/datasource/remote/itemsView_data.dart';
import '../../data/model/item_model.dart';

class ItemViewController extends GetxController {
  StatusRequest? statusRequest;
  ItemViewData itemViewData = ItemViewData(Get.find());
  List<Itemmodel> itemlist = [];

  MyServices myservices = Get.find();
}

class ImpItemViewController extends ItemViewController {
  // ignore: non_constant_identifier_names

  getData() async {
    itemlist.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await itemViewData.getData();
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        print("done");
        List data = response["data"];
        itemlist.addAll(data.map((e) => Itemmodel.fromJson(e)));
      } else {}
    }
    update();
  }

  deleteData(String? itemid, String oldimage) {
    itemViewData.deleteData(itemid!, oldimage);
    itemlist.removeWhere((element) => element.itemsId == itemid);
    update();
  }

  gotoEdit(Itemmodel itemmodel) {
    Get.toNamed(AppRoutes.itemupdate, arguments: {"modelItem": itemmodel});
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
