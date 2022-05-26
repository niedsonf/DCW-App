import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getmage/constants/controllers.dart';
import 'package:getmage/pages/home/widgets/action_menu/action_menu.dart';
import 'package:getmage/pages/home/widgets/main_menu/main_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Stack(
              children: [
                Center(child: Obx(() => imageController.activeImage.value)),
                Container(
                  margin: EdgeInsets.only(bottom: 30),
                  child: ActionMenu(),
                ),
              ],
              alignment: AlignmentDirectional.bottomCenter,
            ),
            flex: 13),
        const Expanded(child: MainMenu()),
      ],
    );
  }
}
