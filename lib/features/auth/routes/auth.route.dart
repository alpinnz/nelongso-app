import 'package:flutter/material.dart';
import 'package:nelongso_app/config/route.config.dart';
import 'package:nelongso_app/core/app.dart';
import 'package:nelongso_app/features/auth/screen/forgot.password.screen.dart';
import 'package:nelongso_app/features/auth/screen/login.screen.dart';
import 'package:nelongso_app/features/auth/screen/logout.screen.dart';
import 'package:nelongso_app/features/auth/screen/register.screen.dart';
import 'package:sailor/sailor.dart';

class RouteConfigAuth {
  static final List<SailorRoute> routes = <SailorRoute>[
    SailorRoute(
      name: RouteConfig.AUTH_LOGIN,
      builder: (context, args, params) {
        return LoginScreen();
      },
    ),
    SailorRoute(
      name: RouteConfig.AUTH_LOGOUT,
      builder: (context, args, params) {
        return LogoutScreen();
      },
    ),
    SailorRoute(
      name: RouteConfig.AUTH_REGISTER,
      builder: (context, args, params) {
        return RegisterScreen();
      },
    ),
    SailorRoute(
      name: RouteConfig.AUTH_FORGOT_PASSWORD,
      builder: (context, args, params) {
        return ForgotPasswordScreen();
      },
    ),
  ];

  // SailorRoute(
  //   name: RouteConfig.AUTH_LOGOUT_PAGE,
  //   builder: (context, args, params) {
  //     return BlocProvider<LogoutBloc>(
  //       create: (context) => LogoutBloc(authApi: AuthApi()),
  //       child: null,
  //     );
  //   },
  // ),

  static void navigateToLogin(BuildContext context, {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.AUTH_LOGIN, (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.AUTH_LOGIN);
    }
  }

  static void navigateToLogout(BuildContext context,
      {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.AUTH_LOGOUT, (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.AUTH_LOGOUT);
    }
  }

  static void navigateToForgotPassword(BuildContext context,
      {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.AUTH_FORGOT_PASSWORD, (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.AUTH_FORGOT_PASSWORD);
    }
  }

  static void navigateToRegister(BuildContext context,
      {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.AUTH_REGISTER, (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.AUTH_REGISTER);
    }
  }
}
