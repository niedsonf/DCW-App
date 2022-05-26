import 'package:flutter/material.dart';
import 'package:getmage/constants/controllers.dart';
import 'package:getmage/routing/router.dart';
import 'package:getmage/routing/routes.dart';

Navigator localNavigator() => Navigator(
      key: navigationController.navigationKey,
      initialRoute: HomeRoute,
      onGenerateRoute: generateRoute,
    );
