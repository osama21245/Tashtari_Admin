import 'package:flutter/material.dart';
import 'package:tashtari_admin/core/constant/color.dart';

import '../../../core/constant/imgaeasset.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(0), // Border radius
      child: Image.asset(
        height: size.height * 0.27,
        width: size.width * 0.27,
        AppImageAsset.logo,
      ),
    );
  }
}
