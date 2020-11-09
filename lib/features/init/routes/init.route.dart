import 'package:flutter/material.dart';
import 'package:nelongso_app/config/route.config.dart';
import 'package:nelongso_app/core/app.dart';
import 'package:nelongso_app/features/init/screen/init.screen.dart';
import 'package:nelongso_app/features/init/screen/splash.screen.dart';
import 'package:sailor/sailor.dart';

class RouteConfigInit {
  static final List<SailorRoute> routes = <SailorRoute>[
    SailorRoute(
      name: RouteConfig.INIT_ROUTE,
      builder: (context, args, params) {
        return InitScreen();
      },
    ),
    SailorRoute(
      name: RouteConfig.SPLASH_ROUTE,
      builder: (context, args, params) {
        return SplashScreen();
      },
    ),
  ];

  static void navigateToInit(BuildContext context, {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.INIT_ROUTE, (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.INIT_ROUTE);
    }
  }

  static void navigateToSplash(BuildContext context,
      {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.SPLASH_ROUTE, (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.SPLASH_ROUTE);
    }
  }
}
