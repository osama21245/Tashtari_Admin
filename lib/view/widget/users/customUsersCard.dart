import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tashtari_admin/controller/users/usersController.dart';

import '../../../core/constant/color.dart';
import '../../../data/model/users_model.dart';

// ignore: must_be_immutable
class CustomUsersCard extends GetView<ImpUsersController> {
  UsersModel userslist;
  bool switchvalue;

  CustomUsersCard({
    super.key,
    required this.userslist,
    required this.switchvalue,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onLongPress: () async {
          await controller.changeAdminStatus(userslist.usersId,
              controller.userstatus[userslist.usersId].toString());

          controller.setusersstatus(userslist.usersId,
              controller.userstatus[userslist.usersId] == "3" ? "2" : "3");
        },
        child: controller.userstatus[userslist.usersId] == "3"
            ? Padding(
                padding: const EdgeInsets.only(
                    left: 14.0, right: 14, bottom: 5, top: 5),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        shape: BoxShape.rectangle,
                        gradient: LinearGradient(
                            colors: [
                              const Color.fromARGB(255, 255, 202, 40),
                              Color.fromARGB(255, 68, 68, 45),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            transform: GradientRotation(3.14 / 4)),
                      ),
                      child: ListTile(
                        trailing:
                            controller.userstatus[userslist.usersId] == "3"
                                ? Text(
                                    "Admin",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  )
                                : Switch(
                                    value: switchvalue,
                                    onChanged: (value) async {
                                      controller.setusersstatus(
                                          userslist.usersId,
                                          switchvalue == false ? "2" : "1");
                                      await controller.changeuserStatus(
                                        userslist.usersId,
                                        switchvalue == true ? "2" : "1",
                                      );
                                    },
                                    activeColor: AppColor.primaryColor,
                                  ),
                        title: Text(
                          "${userslist.usersEmail}",
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text("${userslist.usersCreate}"),
                      ),
                    ),
                    Positioned(
                        right: 75,
                        top: 11,
                        child: Icon(
                          Icons.key,
                          color: Colors.amber[400],
                        ))
                  ],
                ))
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
                child: Stack(
                  children: [
                    Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                        trailing:
                            controller.userstatus[userslist.usersId] == "3"
                                ? Text(
                                    "Admin",
                                    style: TextStyle(
                                        color: AppColor.primaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  )
                                : Switch(
                                    value: switchvalue,
                                    onChanged: (value) async {
                                      controller.setusersstatus(
                                          userslist.usersId,
                                          switchvalue == false ? "2" : "1");
                                      await controller.changeuserStatus(
                                        userslist.usersId,
                                        switchvalue == true ? "2" : "1",
                                      );
                                    },
                                    activeColor: AppColor.primaryColor,
                                  ),
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
                        right: 75,
                        top: 11,
                        child: Text(
                          "${userslist.usersId}",
                          style: const TextStyle(
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                )));
  }
}
