import 'dart:io';

import '../../../core/class/crud.dart';
import '../../../linksApi.dart';

class ItemUpdateData {
  Crud crud;

  ItemUpdateData(this.crud);

  edit(
      String itemname,
      String itemnameAr,
      String description,
      String descriptionAr,
      String price,
      String discount,
      String count,
      String Cat,
      String oldimage,
      String itemid,
      String active,
      [File? file]) async {
    var response;
    if (file != null) {
      response = await crud.addRequestWithImageOne(
          Apilinks.linkupdateitem,
          {
            "itemid": itemid,
            "name": itemname,
            "nameAr": itemnameAr,
            "description": description,
            "descriptionAr": descriptionAr,
            "price": price,
            "discount": discount,
            "count": count,
            "itemscat": Cat,
            "active": "1",
            "date": DateTime.now().toString(),
            "imageold": oldimage
          },
          file);
    } else {
      response = await crud.postData(Apilinks.linkupdateitem, {
        "itemid": itemid,
        "name": itemname,
        "nameAr": itemnameAr,
        "description": description,
        "descriptionAr": descriptionAr,
        "price": price,
        "discount": discount,
        "count": count,
        "itemscat": Cat,
        "active": active,
        "date": DateTime.now().toString(),
        "imageold": oldimage
      });
    }

    return response.fold((l) => l, (r) => r);
  }
}
