import 'package:flutter/material.dart';
import 'package:getmage/constants/controllers.dart';
import 'package:getmage/controllers/auth_controller.dart';
import 'package:getmage/layout.dart';
import 'package:getmage/pages/login/login.dart';

class AuthScreenController extends StatelessWidget {
  const AuthScreenController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (authController.status) {
      case Status.Authenticated:
        return AppLayout();
      case Status.Unauthenticated:
        return LoginPage();
    }
  }
}
