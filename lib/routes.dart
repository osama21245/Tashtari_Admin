import 'package:get/get.dart';
import 'package:tashtari_admin/core/constant/routesname.dart';

import 'package:tashtari_admin/view/screen/auth/forgetpassword/checkemail.dart';
import 'package:tashtari_admin/view/screen/auth/logIn.dart';
import 'package:tashtari_admin/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:tashtari_admin/view/screen/auth/forgetpassword/sucsessResetPassword.dart';

import 'package:tashtari_admin/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:tashtari_admin/view/screen/categories/catView.dart';
import 'package:tashtari_admin/view/screen/home/home.dart';
import 'package:tashtari_admin/view/screen/items/itemAdd.dart';
import 'package:tashtari_admin/view/screen/notfications/notifications.dart';
import 'package:tashtari_admin/view/screen/orders/ordersdetails.dart';

import 'core/middleWare/myMiddleWare.dart';
import 'language.dart';
import 'view/screen/categories/catAdd.dart';
import 'view/screen/categories/catupdate.dart';
import 'view/screen/items/itemView.dart';
import 'view/screen/items/itemupdate.dart';
import 'view/screen/orders/archived.dart';
import 'view/screen/orders/Ordersmain.dart';
import 'view/screen/orders/prepare.dart';
import 'view/users/users.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/", page: () => const Language(), middlewares: [myMiddlware()]),
  GetPage(name: AppRoutes.login, page: () => const Login()),
  GetPage(name: AppRoutes.checkemail, page: () => const Checkemail()),
  GetPage(name: AppRoutes.resetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoutes.verifyCode, page: () => const VerifyCode()),
  GetPage(
      name: AppRoutes.sucsessresetPassword,
      page: () => const sucessResetPassword()),
  GetPage(name: AppRoutes.homemain, page: () => const Home()),
  GetPage(name: AppRoutes.homepage, page: () => const prepare()),
  GetPage(name: AppRoutes.OrdersDetails, page: () => const OrdersDetails()),
  GetPage(name: AppRoutes.Orderarchive, page: () => const Orderarchive()),
  GetPage(name: AppRoutes.Ordersmain, page: () => const Ordersmain()),
  GetPage(name: AppRoutes.categoriesView, page: () => const CatView()),
  GetPage(name: AppRoutes.categoriesEdit, page: () => const CatUpdate()),
  GetPage(name: AppRoutes.categoriesAdd, page: () => const CatAdd()),
  GetPage(name: AppRoutes.itemAdd, page: () => const ItemAdd()),
  GetPage(name: AppRoutes.itemupdate, page: () => const ItemUpdate()),
  GetPage(name: AppRoutes.itemview, page: () => const ItemView()),
  GetPage(name: AppRoutes.Notifications, page: () => const Notifications()),
  GetPage(name: AppRoutes.users, page: () => const Users()),
];
