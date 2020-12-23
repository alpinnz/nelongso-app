import 'package:flutter/material.dart';
import 'package:nelongso_app/config/route.config.dart';
import 'package:nelongso_app/core/app.dart';
import 'package:nelongso_app/features/marketing/screen/analytics.screen.dart';
import 'package:nelongso_app/features/marketing/screen/customer.screen.dart';
import 'package:nelongso_app/features/marketing/screen/sales.ketercapaian.screen.dart';
import 'package:nelongso_app/features/marketing/screen/sales.lose.screen.dart';
import 'package:nelongso_app/features/marketing/screen/marketing.screen.dart';
import 'package:nelongso_app/features/marketing/screen/sales.potensial.screen.dart';
import 'package:nelongso_app/features/marketing/screen/sales.screen.dart';
import 'package:nelongso_app/features/marketing/screen/sales.trend.screen.dart';
import 'package:sailor/sailor.dart';

class RouteConfigMarketing {
  static final List<SailorRoute> routes = <SailorRoute>[
    SailorRoute(
      name: RouteConfig.MARKETING,
      builder: (context, args, params) {
        return MarketingScreen();
      },
    ),
    SailorRoute(
      name: RouteConfig.MARKETING_SALES,
      builder: (context, args, params) {
        return SalesScreen();
      },
    ),
    SailorRoute(
      name: RouteConfig.MARKETING_SALES_KETERCAPAIAN,
      builder: (context, args, params) {
        return SalesKetercapaianScreen();
      },
    ),
    SailorRoute(
      name: RouteConfig.MARKETING_SALES_LOSESALE,
      builder: (context, args, params) {
        return SalesLoseScreen();
      },
    ),
    SailorRoute(
      name: RouteConfig.MARKETING_SALES_POTENSIAL,
      builder: (context, args, params) {
        return SalesPotensialScreen();
      },
    ),
    SailorRoute(
      name: RouteConfig.MARKETING_SALES_TRENDOMZET,
      builder: (context, args, params) {
        return SalesTrendScreen();
      },
    ),
    SailorRoute(
      name: RouteConfig.MARKETING_ANALYTICS,
      builder: (context, args, params) {
        return AnalyticsScreen();
      },
    ),
    SailorRoute(
      name: RouteConfig.MARKETING_CUSTOMER,
      builder: (context, args, params) {
        return CustomerScreen();
      },
    ),
  ];

  static void navigateMarketing(BuildContext context,
      {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.MARKETING, (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.MARKETING);
    }
  }

  static void navigateMarketingSales(BuildContext context,
      {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.MARKETING_SALES, (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.MARKETING_SALES);
    }
  }

  static void navigateMarketingSalesPotensial(BuildContext context,
      {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.MARKETING_SALES_POTENSIAL,
          (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.MARKETING_SALES_POTENSIAL);
    }
  }

  static void navigateMarketingSalesKetercapaian(BuildContext context,
      {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.MARKETING_SALES_KETERCAPAIAN,
          (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.MARKETING_SALES_KETERCAPAIAN);
    }
  }

  static void navigateMarketingSalesLoseSale(BuildContext context,
      {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.MARKETING_SALES_LOSESALE,
          (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.MARKETING_SALES_LOSESALE);
    }
  }

  static void navigateMarketingSalesTrendOmzet(BuildContext context,
      {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.MARKETING_SALES_TRENDOMZET,
          (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.MARKETING_SALES_TRENDOMZET);
    }
  }

  static void navigateMarketingAnalytics(BuildContext context,
      {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.MARKETING_ANALYTICS, (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.MARKETING_ANALYTICS);
    }
  }

  static void navigateMarketingCustomer(BuildContext context,
      {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.MARKETING_CUSTOMER, (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.MARKETING_CUSTOMER);
    }
  }
}
