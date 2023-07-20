import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home/homeControoler.dart';

// ignore: must_be_immutable
class CustomHomeCard extends GetView<ImphomePageControoler> {
  String url;
  String Textname;
  final void Function()? ontap;
  Size size;
  CustomHomeCard(
      {super.key,
      required this.Textname,
      required this.url,
      required this.size,
      this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Image.asset(
                url,
                width: size.width * 0.22,
              ),
            ),
            Text(
              Textname,
              style: TextStyle(
                  color: Color.fromARGB(255, 121, 119, 119),
                  fontWeight: FontWeight.bold,
                  fontFamily: "PlayfairDisplay",
                  fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}
