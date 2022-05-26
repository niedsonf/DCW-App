import 'package:flutter/material.dart';
import 'package:getmage/pages/gallery/gallery.dart';
import 'package:getmage/pages/home/home.dart';
import 'package:getmage/routing/routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case GalleryRoute:
      return _getPageRoute(const Gallery());
    case HomeRoute:
    default:
      return _getPageRoute(const HomePage());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: ((context) => child));
}
