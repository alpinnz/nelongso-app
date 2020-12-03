import 'package:flutter/material.dart';
import 'package:nelongso_app/config/route.config.dart';
import 'package:nelongso_app/core/app.dart';
import 'package:nelongso_app/features/bisdev/model/investor.model.dart';
import 'package:nelongso_app/features/bisdev/screen/bisdev.screen.dart';
import 'package:nelongso_app/features/bisdev/screen/investor.detail.screen.dart';
import 'package:nelongso_app/features/bisdev/screen/investor.screen.dart';
import 'package:nelongso_app/features/bisdev/screen/outlet.screen.dart';
import 'package:sailor/sailor.dart';

class RouteConfigBisdev {
  static final List<SailorRoute> routes = <SailorRoute>[
    SailorRoute(
      name: RouteConfig.BISDEV,
      builder: (context, args, params) {
        return BisdevScreen();
      },
    ),
    SailorRoute(
      name: RouteConfig.BISDEV_INVESTOR,
      builder: (context, args, params) {
        return InvestorScreen();
      },
    ),
    SailorRoute(
      name: RouteConfig.BISDEV_INVESTOR_DETAIL,
      builder: (context, args, params) {
        return InvestorDetailScreen();
      },
      params: [
        SailorParam<InvestorModel>(
          name: 'data',
          defaultValue: InvestorModel(),
        ),
      ],
    ),
    SailorRoute(
      name: RouteConfig.BISDEV_OUTLET,
      builder: (context, args, params) {
        return OutletScreen();
      },
    ),
  ];

  static void navigateBisdev(BuildContext context, {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.BISDEV, (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.BISDEV);
    }
  }

  static void navigateBisdevInvestor(BuildContext context,
      {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.BISDEV_INVESTOR, (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.BISDEV_INVESTOR);
    }
  }

  static void navigateBisdevInvestoDetail(
      BuildContext context, InvestorModel data,
      {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.BISDEV_INVESTOR_DETAIL, (Route<dynamic> route) => false);
    } else {
      App.main.router
          .navigate<bool>(RouteConfig.BISDEV_INVESTOR_DETAIL, params: {
        'data': data,
      });
    }
  }

  static void navigateBisdevOutlet(BuildContext context,
      {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.BISDEV_OUTLET, (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.BISDEV_OUTLET);
    }
  }
}
