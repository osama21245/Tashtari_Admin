import '../../../core/class/crud.dart';
import '../../../linksApi.dart';

class ItemViewData {
  Crud crud;

  ItemViewData(this.crud);

  getData() async {
    var response = await crud.postData(Apilinks.linkViewitem, {});
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String catid, String oldimage) async {
    var response = await crud.postData(
        Apilinks.linkDeletitem, {"itemid": catid, "oldimage": oldimage});
    return response.fold((l) => l, (r) => r);
  }
}
