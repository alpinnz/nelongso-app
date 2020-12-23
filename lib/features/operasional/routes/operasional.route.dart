import 'package:flutter/material.dart';
import 'package:nelongso_app/config/route.config.dart';
import 'package:nelongso_app/core/app.dart';
import 'package:nelongso_app/features/operasional/screen/analytics.screen.dart';
import 'package:nelongso_app/features/operasional/screen/general.cleaning.screen.dart';
import 'package:nelongso_app/features/operasional/screen/general.inventaris.screen.dart';
import 'package:nelongso_app/features/operasional/screen/general.penilaian.screen.dart';
import 'package:nelongso_app/features/operasional/screen/general.screen.dart';
import 'package:nelongso_app/features/operasional/screen/maintenance.screen.dart';
import 'package:nelongso_app/features/operasional/screen/operasional.screen.dart';
import 'package:nelongso_app/features/operasional/screen/training.screen.dart';
import 'package:sailor/sailor.dart';

class RouteConfigOperasional {
  static final List<SailorRoute> routes = <SailorRoute>[
    SailorRoute(
      name: RouteConfig.OPERASIONAL,
      builder: (context, args, params) {
        return OperasionalScreen();
      },
    ),
    SailorRoute(
      name: RouteConfig.OPERASIONAL_ANALYTICS,
      builder: (context, args, params) {
        return AnalyticsScreen();
      },
    ),
    SailorRoute(
      name: RouteConfig.OPERASIONAL_MAINTENANCE,
      builder: (context, args, params) {
        return MaintenanceScreen();
      },
    ),
    SailorRoute(
      name: RouteConfig.OPERASIONAL_TRAINING,
      builder: (context, args, params) {
        return TrainingScreen();
      },
    ),
    SailorRoute(
      name: RouteConfig.OPERASIONAL_GENERAL,
      builder: (context, args, params) {
        return GeneralScreen();
      },
    ),
    SailorRoute(
      name: RouteConfig.OPERASIONAL_GENERAL_PENILAIAN,
      builder: (context, args, params) {
        return GeneralPenilaianScreen();
      },
    ),
    SailorRoute(
      name: RouteConfig.OPERASIONAL_GENERAL_CLEANING,
      builder: (context, args, params) {
        return GeneralCleaningScreen();
      },
    ),
    SailorRoute(
      name: RouteConfig.OPERASIONAL_GENERAL_INVENTARIS,
      builder: (context, args, params) {
        return GeneralInventarisScreen();
      },
    ),
  ];

  static void navigateOperasional(BuildContext context,
      {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.OPERASIONAL, (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.OPERASIONAL);
    }
  }

  static void navigateOperasionalGeneralPenilaian(BuildContext context,
      {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.OPERASIONAL_GENERAL_PENILAIAN,
          (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.OPERASIONAL_GENERAL_PENILAIAN);
    }
  }

  static void navigateOperasionalGeneralInventaris(BuildContext context,
      {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.OPERASIONAL_GENERAL_INVENTARIS,
          (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.OPERASIONAL_GENERAL_INVENTARIS);
    }
  }

  static void navigateOperasionalGeneralCleaning(BuildContext context,
      {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.OPERASIONAL_GENERAL_CLEANING,
          (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.OPERASIONAL_GENERAL_CLEANING);
    }
  }

  static void navigateOperasionalTraining(BuildContext context,
      {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.OPERASIONAL_TRAINING, (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.OPERASIONAL_TRAINING);
    }
  }

  static void navigateOperasionalMaintenance(BuildContext context,
      {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.OPERASIONAL_MAINTENANCE, (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.OPERASIONAL_MAINTENANCE);
    }
  }

  static void navigateOperasionalAnalytics(BuildContext context,
      {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.OPERASIONAL_ANALYTICS, (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.OPERASIONAL_ANALYTICS);
    }
  }

  static void navigateOperasionalGeneral(BuildContext context,
      {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.OPERASIONAL_GENERAL, (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.OPERASIONAL_GENERAL);
    }
  }
}
