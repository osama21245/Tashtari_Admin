import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
import '../../../data/model/users_model.dart';

// ignore: must_be_immutable
class CustomsearchResult extends StatelessWidget {
  UsersModel userslist;
  CustomsearchResult({super.key, required this.userslist});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
        child: Stack(
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                trailing: Switch(value: false, onChanged: (value2) {}),
                title: Text(
                  "${userslist.usersEmail}",
                  style: const TextStyle(
                      color: AppColor.primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text("${userslist.usersCreate}"),
              ),
            ),
            Positioned(
                right: 65,
                top: 11,
                child: Text(
                  "${userslist.usersId}",
                  style: const TextStyle(color: AppColor.primaryColor),
                ))
          ],
        ));
  }
}
