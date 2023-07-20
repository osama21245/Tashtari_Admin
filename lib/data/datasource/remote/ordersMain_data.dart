import '../../../core/class/crud.dart';
import '../../../linksApi.dart';

class OrdersMainData {
  Crud crud;

  OrdersMainData(this.crud);

  getPrepareData() async {
    var response = await crud.postData(Apilinks.linkordersprepareview, {});
    return response.fold((l) => l, (r) => r);
  }

  ApproveOrder(String usersid, String orderid, String dleiveryman) async {
    var response = await crud.postData(Apilinks.linkorderapprove,
        {"userid": usersid, "orderid": orderid, "deliveryid": dleiveryman});
    return response.fold((l) => l, (r) => r);
  }

  getAcceptData() async {
    var response = await crud.postData(Apilinks.linkordersaccepted, {});
    return response.fold((l) => l, (r) => r);
  }

  getOntheWayData() async {
    var response = await crud.postData(Apilinks.linkordersviewOntheway, {});
    return response.fold((l) => l, (r) => r);
  }

  getArciveData() async {
    var response = await crud.postData(Apilinks.linkordersarchive, {});
    return response.fold((l) => l, (r) => r);
  }

  Acceptorder(
    String usersid,
    String orderid,
  ) async {
    var response = await crud.postData(Apilinks.linkorderapprove, {
      "userid": usersid,
      "orderid": orderid,
    });
    return response.fold((l) => l, (r) => r);
  }

  prepared(String usersid, String orderid, String ordertype) async {
    var response = await crud.postData(Apilinks.linkordersprepare,
        {"userid": usersid, "orderid": orderid, "ordertype": ordertype});
    return response.fold((l) => l, (r) => r);
  }
}
