import 'package:flutter/material.dart';
import 'package:getmage/constants/controllers.dart';
import 'package:getmage/constants/style.dart';
import 'package:getmage/pages/home/widgets/action_menu/action_button.dart';
import 'package:getmage/pages/home/widgets/search_options_menu/filters_modal.dart';
import 'package:getmage/services/user.dart';

class ActionMenu extends StatefulWidget {
  const ActionMenu({Key? key}) : super(key: key);

  @override
  State<ActionMenu> createState() => _ActionMenuState();
}

class _ActionMenuState extends State<ActionMenu> with TickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<ActionButton> actionButtons = [
      ActionButton(
          bgColor: dark,
          iconColor: lightRed,
          icon: Icons.filter,
          onTap: () {
            showModalBottomSheet(
                transitionAnimationController: controller,
                barrierColor: Colors.transparent,
                backgroundColor: Colors.transparent,
                context: context,
                builder: (BuildContext context) {
                  return SettingsModal(animationController: controller);
                });
          }),
      ActionButton(
          bgColor: dark,
          iconColor: Colors.greenAccent,
          icon: Icons.favorite,
          onTap: () {
            UserServices.addFavorite(
                id: authController.userModel.id,
                category: menuController.activeItem.value.toLowerCase(),
                url: imageController.activeURL.value);
          }),
    ];

    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [...actionButtons],
    ));
  }
}
