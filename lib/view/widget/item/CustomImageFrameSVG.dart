import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constant/color.dart';

// ignore: must_be_immutable
class CustomImageFrameSVG extends StatelessWidget {
  File file;
  Size size;

  CustomImageFrameSVG({super.key, required this.file, required this.size});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        width: size.width * 0.2,
        decoration: BoxDecoration(
            border: Border.all(width: 2, color: AppColor.primaryColor),
            shape: BoxShape.circle),
        child: Padding(
          padding: const EdgeInsets.all(17.0),
          child: SvgPicture.file(
            file,
            width: size.width * 0.2,
          ),
        ),
      ),
    );
  }
}
