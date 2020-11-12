import 'package:flutter/material.dart';
import 'package:nelongso_app/config/route.config.dart';
import 'package:nelongso_app/core/app.dart';
import 'package:nelongso_app/features/home/screen/home.screen.dart';
import 'package:sailor/sailor.dart';

class RouteConfigHome {
  static final List<SailorRoute> routes = <SailorRoute>[
    SailorRoute(
      name: RouteConfig.HOME,
      builder: (context, args, params) {
        return HomeScreen();
      },
    ),
  ];

  static void navigateToHome(BuildContext context, {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.HOME, (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.HOME);
    }
  }
}
