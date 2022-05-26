import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getmage/constants/controllers.dart';
import 'package:getmage/constants/style.dart';
import 'package:getmage/widgets/drawer_menu_icon.dart';

AppBar topNav(BuildContext context, GlobalKey<ScaffoldState> scaffoldKey,
        AnimationController controller) =>
    AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      toolbarHeight: 60,
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.vertical(bottom: Radius.elliptical(50, 30))),
      elevation: 2,
      backgroundColor: grey,
      actions: [
        DrawerMenuIcon(
          scaffoldKey: scaffoldKey,
          controller: controller,
        ),
        SizedBox(width: 50)
      ],
      title: Row(
        children: [
          Expanded(child: Container()),
          CircleAvatar(
            backgroundImage: authController.user.photoURL != null
                ? NetworkImage(authController.user.photoURL!)
                : null,
            backgroundColor: Colors.transparent,
            radius: 20,
          ),
          const SizedBox(width: 15),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: 'Hello,\n',
                style: TextStyle(
                    fontSize: 14, color: dark, fontWeight: FontWeight.w400)),
            TextSpan(
                text: authController.userModel.name,
                style: TextStyle(
                    fontSize: 16, color: dark, fontWeight: FontWeight.w300)),
          ])),
          Expanded(child: Container(), flex: 4),
        ],
      ),
    );
