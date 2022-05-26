import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

const int smallScreenSize = 100;

class ResponsiveWidget extends StatelessWidget {
  final Widget smallScreen;
  final Widget? largeScreen;
  const ResponsiveWidget(
      {Key? key, required this.smallScreen, this.largeScreen})
      : super(key: key);

  static bool isSmallScreen(BuildContext context) =>
      MediaQuery.of(context).size.width <= smallScreenSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
      if (constraints.maxWidth <= smallScreenSize) {
        return smallScreen;
      } else {
        return smallScreen;
      }
    }));
  }
}
