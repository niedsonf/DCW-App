import 'package:flutter/material.dart';
import 'package:getmage/constants/controllers.dart';

import 'package:getmage/routing/routes.dart';
import 'package:getmage/widgets/drawer_menu/widgets/drawer_menu_item.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        navigationController.actualPage.value == HomeRoute
            ? DrawerMenuItem(
                text: 'Gallery',
                icon: Icons.browse_gallery,
                onTap: () {
                  Navigator.pop(context);
                  navigationController.navigatoTo(GalleryRoute);
                })
            : DrawerMenuItem(
                text: 'Home',
                icon: Icons.home,
                onTap: () {
                  Navigator.pop(context);
                  navigationController.navigatoTo(HomeRoute);
                }),
        SizedBox(height: 25),
        DrawerMenuItem(
            text: 'Logout',
            icon: Icons.logout,
            onTap: () {
              authController.signOut();
            }),
      ],
    );
  }
}
