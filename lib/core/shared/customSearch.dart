import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/services/services.dart';
import '../constant/color.dart';

class Customsearech extends StatelessWidget {
  final void Function()? onpressedsearch;
  final TextEditingController mycontroller;
  final void Function(String)? onchange;

  const Customsearech({
    super.key,
    required this.onchange,
    required this.onpressedsearch,
    required this.mycontroller,
  });

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();

    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(children: [
        Expanded(
            child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                  colors: [
                    AppColor.primaryColor,
                    Colors.white,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  transform: GradientRotation(3.14 / 4))),
          child: TextFormField(
            controller: mycontroller,
            onChanged: onchange,
            decoration: InputDecoration(
              prefixIcon: IconButton(
                icon: const Icon(Icons.search),
                onPressed: onpressedsearch,
              ),
              hintText: "26".tr,
              hintStyle: TextStyle(
                  fontSize: 18,
                  fontFamily: "PlayfairDisplay",
                  color:
                      myServices.sharedPreferences.getBool("isDarkMode") == true
                          ? const Color.fromARGB(255, 245, 244, 244)
                          : null),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)),
              filled: true,
              // fillColor:
              //     myServices.sharedPreferences.getBool("isDarkMode") == true
              //         ? const Color.fromARGB(255, 153, 152, 152)
              //         : Colors.grey[200]
            ),
          ),
        )),
      ]),
    );
  }
}
