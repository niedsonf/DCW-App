import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getmage/constants/controllers.dart';
import 'package:getmage/constants/style.dart';
import 'package:getmage/controllers/menu_controller.dart';
import 'package:getmage/pages/home/widgets/main_menu/menu_item.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget leftMenuDivider = Obx(() => AnimatedContainer(
          curve: Curves.bounceInOut,
          duration: const Duration(milliseconds: 300),
          width: 1,
          color: light,
          height: menuController.isActive(CatMenuItem)
              ? 25
              : menuController.isActive(DogMenuItem)
                  ? 30
                  : 20,
        ));
    Widget rightMenuDivider = Obx(() => AnimatedContainer(
          curve: Curves.bounceInOut,
          duration: const Duration(milliseconds: 300),
          width: 1,
          color: light,
          height: menuController.isActive(CatMenuItem)
              ? 25
              : menuController.isActive(WaifuMenuItem)
                  ? 30
                  : 20,
        ));
    List<MainMenuItem> getMenuItems() => menuItems
        .map((e) => MainMenuItem(
            itemName: e,
            onTap: () {
              if (!menuController.isActive(e)) {
                menuController.changeActiveItemTo(e);
              }
            }))
        .toList();
    List<Widget> menuDisplay = [...getMenuItems()];
    menuDisplay.insert(1, leftMenuDivider);
    menuDisplay.insert(3, rightMenuDivider);
    return Container(
        color: dark,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [...menuDisplay],
        ));
  }
}
