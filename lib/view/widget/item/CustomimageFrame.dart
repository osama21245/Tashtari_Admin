import 'dart:io';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomImageFrame extends StatelessWidget {
  File url;
  Size size;

  CustomImageFrame({super.key, required this.url, required this.size});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        width: size.width * 0.2,
        // decoration: BoxDecoration(
        //     border: Border.all(width: 2, color: AppColor.primaryColor),
        //     shape: BoxShape.circle),
        child: Padding(
          padding: const EdgeInsets.all(17.0),
          child: Image.file(
            url,
            width: size.width * 0.2,
          ),
        ),
      ),
    );
  }
}
