import 'dart:io';

import '../../../core/class/crud.dart';
import '../../../linksApi.dart';

class ItemAddData {
  Crud crud;

  ItemAddData(this.crud);

  add(
      String itemname,
      String itemnameAr,
      String description,
      String descriptionAr,
      String price,
      String discount,
      String count,
      String Cat,
      File file) async {
    var response = await crud.addRequestWithImageOne(
        Apilinks.linkAdditem,
        {
          "name": itemname,
          "nameAr": itemnameAr,
          "description": description,
          "descriptionAr": descriptionAr,
          "price": price,
          "discount": discount,
          "count": count,
          "itemscat": Cat,
          "active": "1",
          "date": DateTime.now().toString()
        },
        file);
    return response.fold((l) => l, (r) => r);
  }
}
