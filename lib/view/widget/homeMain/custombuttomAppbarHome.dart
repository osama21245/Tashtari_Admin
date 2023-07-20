import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:tashtari_admin/controller/orders/OrdersmainController.dart';
import 'package:tashtari_admin/view/widget/homeMain/CustombottomAppbar.dart';

import '../../../core/function/databaseTranslate.dart';

class customBottomAppBarHome extends StatelessWidget {
  const customBottomAppBarHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ImpOrdersmainController>(
        builder: (controller) => BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 3,
            child: Container(
              child: Row(
                children: [
                  ...List.generate(controller.listpage.length + 1, ((index) {
                    int i = index > 2 ? index - 1 : index;
                    return index == 2
                        ? const Spacer()
                        : customBottomAppbar(
                            Texticon: controller.titlebottomappbar[i],
                            icon: controller.iconbottomappbar[i],
                            onpressed: () {
                              controller.changePage(i);
                            },
                            active: controller.currentpage == i ? true : false);
                  }))
                ],
              ),
            )));
  }
}
