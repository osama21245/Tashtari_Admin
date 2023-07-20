import 'dart:io';

import '../../../core/class/crud.dart';
import '../../../linksApi.dart';

class CatUpdateData {
  Crud crud;

  CatUpdateData(this.crud);

  edit(
      String Categoryname, String CategorynameAr, String Catid, String oldimage,
      [File? file]) async {
    var response;
    if (file != null) {
      response = await crud.addRequestWithImageOne(
          Apilinks.linkupdateCat,
          {
            "catname": Categoryname,
            "catnameAr": CategorynameAr,
            "catid": Catid,
            "imageold": oldimage
          },
          file);
    } else {
      response = await crud.postData(Apilinks.linkupdateCat, {
        "catname": Categoryname,
        "catnameAr": CategorynameAr,
        "catid": Catid,
        "imageold": oldimage
      });
    }

    return response.fold((l) => l, (r) => r);
  }
}
