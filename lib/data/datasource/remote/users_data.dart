import '../../../core/class/crud.dart';
import '../../../linksApi.dart';

class UsersData {
  Crud crud;

  UsersData(this.crud);

  getdata() async {
    var response = await crud.postData(Apilinks.linkviewUsers, {});
    return response.fold((l) => l, (r) => r);
  }

  changeUserStatus(
    String userstatus,
    String userid,
  ) async {
    var response = await crud.postData(Apilinks.linkschangeuserStatus,
        {"userStatus": userstatus, "id": userid});
    return response.fold((l) => l, (r) => r);
  }

  changeAdminStatus(
    String userstatus,
    String userid,
  ) async {
    var response = await crud.postData(Apilinks.linkschangeAdminStatus,
        {"userStatus": userstatus, "id": userid});
    return response.fold((l) => l, (r) => r);
  }

  search(
    String search,
  ) async {
    var response = await crud.postData(Apilinks.linksearch, {"search": search});
    return response.fold((l) => l, (r) => r);
  }
}
