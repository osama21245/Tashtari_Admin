import 'dart:io';

import '../../../core/class/crud.dart';
import '../../../linksApi.dart';

class CatAddData {
  Crud crud;

  CatAddData(this.crud);

  add(String Categoryname, String CategorynameAr, File file) async {
    var response = await crud.addRequestWithImageOne(Apilinks.linkAddCat,
        {"catname": Categoryname, "catnameAr": CategorynameAr}, file);
    return response.fold((l) => l, (r) => r);
  }
}
