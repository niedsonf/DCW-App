import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getmage/constants/controllers.dart';
import 'package:getmage/constants/style.dart';

class MainMenuItem extends StatelessWidget {
  final String itemName;
  final Function() onTap;
  const MainMenuItem({Key? key, required this.itemName, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      onHover: (value) {
        value ? menuController.onHover(itemName) : menuController.onHover('');
      },
      child: Obx(() => SizedBox(
            width: _width / 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.all(5),
                    child: menuController.returnIconFor(itemName)),
                Text(itemName,
                    style: TextStyle(
                        color: grey,
                        fontWeight: FontWeight.w300,
                        fontSize: menuController.isActive(itemName) ? 12 : 10))
              ],
            ),
          )),
    );
  }
}
