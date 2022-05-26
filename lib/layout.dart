import 'package:flutter/material.dart';
import 'package:getmage/helpers/responsiveness.dart';
import 'package:getmage/widgets/drawer_menu/drawer.dart';
import 'package:getmage/widgets/small_screen.dart';
import 'package:getmage/widgets/top_nav.dart';

class AppLayout extends StatefulWidget {
  AppLayout({Key? key}) : super(key: key);

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  late AnimationController animationController;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        //extendBodyBehindAppBar: true,
        endDrawer: DrawerMenu(),
        onEndDrawerChanged: (isOpen) {
          !isOpen
              ? animationController.reverse()
              : animationController.forward();
        },
        drawerScrimColor: Colors.transparent,
        appBar: topNav(context, scaffoldKey, animationController),
        body: ResponsiveWidget(smallScreen: SmallScreen()));
  }
}
