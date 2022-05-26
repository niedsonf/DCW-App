import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getmage/constants/style.dart';

class DrawerMenuIcon extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final AnimationController controller;
  const DrawerMenuIcon(
      {Key? key, required this.scaffoldKey, required this.controller})
      : super(key: key);

  @override
  State<DrawerMenuIcon> createState() => _DrawerMenuIconState();
}

class _DrawerMenuIconState extends State<DrawerMenuIcon>
    with SingleTickerProviderStateMixin {
  late Animation<double> rotateAnimation;

  @override
  void initState() {
    rotateAnimation = Tween<double>(begin: 0, end: 4.5).animate(
        CurvedAnimation(parent: widget.controller, curve: Curves.elasticOut));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          widget.scaffoldKey.currentState!.openEndDrawer();
        },
        child: RotationTransition(
            turns: rotateAnimation,
            child: Icon(
              FontAwesomeIcons.arrowLeftLong,
              color: dark,
            )));
  }
}
