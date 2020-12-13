import 'package:flutter/material.dart';
import 'package:nelongso_app/config/route.config.dart';
import 'package:nelongso_app/core/app.dart';
import 'package:nelongso_app/features/finance/screen/allregional.screen.dart';
import 'package:nelongso_app/features/finance/screen/analytics.screen.dart';
import 'package:nelongso_app/features/finance/screen/finance.screen.dart';
import 'package:nelongso_app/features/finance/screen/general.screen.dart';
import 'package:nelongso_app/features/finance/screen/noncash.screen.dart';
import 'package:nelongso_app/features/finance/screen/outlet.screen.dart';
import 'package:nelongso_app/features/finance/screen/regional.screen.dart';
import 'package:sailor/sailor.dart';

class RouteConfigFinance {
  static final List<SailorRoute> routes = <SailorRoute>[
    SailorRoute(
      name: RouteConfig.FINANCE,
      builder: (context, args, params) {
        return FinanceScreen();
      },
    ),
    SailorRoute(
      name: RouteConfig.FINANCE_GENERAL,
      builder: (context, args, params) {
        return GeneralScreen();
      },
    ),
    SailorRoute(
      name: RouteConfig.FINANCE_GENERAL_ALLREGIONAL,
      builder: (context, args, params) {
        return AllRegionalScreen();
      },
    ),
    SailorRoute(
      name: RouteConfig.FINANCE_GENERAL_NONCASH,
      builder: (context, args, params) {
        return NoncashScreen();
      },
    ),
    SailorRoute(
      name: RouteConfig.FINANCE_GENERAL_REGIONAL,
      builder: (context, args, params) {
        return RegionalScreen();
      },
    ),
    SailorRoute(
      name: RouteConfig.FINANCE_ANALYTICS,
      builder: (context, args, params) {
        return AnalyticsScreen();
      },
    ),
    SailorRoute(
      name: RouteConfig.FINANCE_OUTLET,
      builder: (context, args, params) {
        return OutletScreen();
      },
    ),
  ];

  static void navigateFinance(BuildContext context, {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.FINANCE, (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.FINANCE);
    }
  }

  static void navigateFinanceGeneral(BuildContext context,
      {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.FINANCE_GENERAL, (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.FINANCE_GENERAL);
    }
  }

  static void navigateFinanceAnalytics(BuildContext context,
      {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.FINANCE_ANALYTICS, (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.FINANCE_ANALYTICS);
    }
  }

  static void navigateFinanceOutlet(BuildContext context,
      {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.FINANCE_OUTLET, (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.FINANCE_OUTLET);
    }
  }

  static void navigateFinanceGeneralAllRegional(BuildContext context,
      {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.FINANCE_GENERAL_ALLREGIONAL,
          (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.FINANCE_GENERAL_ALLREGIONAL);
    }
  }

  static void navigateFinanceGeneralRegional(BuildContext context,
      {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.FINANCE_GENERAL_REGIONAL,
          (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.FINANCE_GENERAL_REGIONAL);
    }
  }

  static void navigateFinanceGeneralNonCash(BuildContext context,
      {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.FINANCE_GENERAL_NONCASH, (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.FINANCE_GENERAL_NONCASH);
    }
  }
}
