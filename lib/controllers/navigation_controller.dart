import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:getmage/routing/routes.dart';

class NavigationController extends GetxController {
  static NavigationController instance = Get.find();
  final GlobalKey<NavigatorState> navigationKey = GlobalKey();

  var actualPage = HomeRoute.obs;

  Future<dynamic> navigatoTo(String routeName) {
    actualPage.value = routeName;
    return navigationKey.currentState!.pushNamed(routeName);
  }

  goBack() => navigationKey.currentState!.pop();
}
