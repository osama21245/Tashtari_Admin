import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/services/services.dart';
import '../../core/function/handlingdata.dart';
import '../../data/datasource/remote/ordersMain_data.dart';
import '../../data/model/orders_model.dart';

class OrdersprepareController extends GetxController {
  StatusRequest? statusRequest;
  OrdersMainData OrderMainddata = OrdersMainData(Get.find());
  List<OrdersModel> orderslist = [];

  MyServices myservices = Get.find();
}

class ImpordersprepareController extends OrdersprepareController {
  // ignore: non_constant_identifier_names
  String ReturnorderStatus(String order) {
    if (order == "0") {
      return "Await Approval";
    } else if (order == "1") {
      return "Accepted";
    } else if (order == "2") {
      return "Prepare";
    } else if (order == "3") {
      return "On the way";
    } else if (order == "4") {
      return "Archive";
    } else {
      return "Un Known";
    }
  }

  resetData() {
    orderslist.clear();
    update();
  }

  refreshpage() {
    resetData();
    getData();
    update();
  }

  getData() async {
    orderslist.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await OrderMainddata.getPrepareData();
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        List data = response["data"];
        orderslist.addAll(data.map((e) => OrdersModel.fromJson(e)));
      } else {}
    }
    update();
  }

  Approve(String orderid, String userid, String ordertype) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await OrderMainddata.prepared(userid, orderid, ordertype);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        print("success");
        getData();
      } else {
        print("fail");
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
