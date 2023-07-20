import '../../../core/class/crud.dart';
import '../../../linksApi.dart';

class CatViewData {
  Crud crud;

  CatViewData(this.crud);

  getData() async {
    var response = await crud.postData(Apilinks.linkViewCat, {});
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String catid, String oldimage) async {
    var response = await crud.postData(
        Apilinks.linkDeleteCat, {"catid": catid, "oldimage": oldimage});
    return response.fold((l) => l, (r) => r);
  }
}
