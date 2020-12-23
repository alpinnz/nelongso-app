import 'package:flutter/material.dart';
import 'package:nelongso_app/config/route.config.dart';
import 'package:nelongso_app/core/app.dart';
import 'package:nelongso_app/features/produksi/screen/analytics.screen.dart';
import 'package:nelongso_app/features/produksi/screen/central.screen.dart';
import 'package:nelongso_app/features/produksi/screen/logistics.kapten.screen.dart';
import 'package:nelongso_app/features/produksi/screen/logistics.penjualan.screen.dart';
import 'package:nelongso_app/features/produksi/screen/logistics.screen.dart';
import 'package:nelongso_app/features/produksi/screen/logistics.update.screen.dart';
import 'package:nelongso_app/features/produksi/screen/materials.dashboard.screen.dart';
import 'package:nelongso_app/features/produksi/screen/materials.grup.screen.dart';
import 'package:nelongso_app/features/produksi/screen/materials.outlet.screen.dart';
import 'package:nelongso_app/features/produksi/screen/materials.screen.dart';
import 'package:nelongso_app/features/produksi/screen/outlet.screen.dart';
import 'package:nelongso_app/features/produksi/screen/produksi.screen.dart';
import 'package:nelongso_app/features/produksi/screen/quality.screen.dart';

import 'package:sailor/sailor.dart';

class RouteConfigProduksi {
  static final List<SailorRoute> routes = <SailorRoute>[
    SailorRoute(
      name: RouteConfig.PRODUKSI,
      builder: (context, args, params) {
        return ProduksiScreen();
      },
    ),
    SailorRoute(
      name: RouteConfig.PRODUKSI_ANALYTICS,
      builder: (context, args, params) {
        return AnalyticsScreen();
      },
    ),
    SailorRoute(
      name: RouteConfig.PRODUKSI_CENTRAL,
      builder: (context, args, params) {
        return CentralScreen();
      },
    ),
    SailorRoute(
      name: RouteConfig.PRODUKSI_OUTLET,
      builder: (context, args, params) {
        return OutletScreen();
      },
    ),
    SailorRoute(
      name: RouteConfig.PRODUKSI_QUALITY,
      builder: (context, args, params) {
        return QualityScreen();
      },
    ),
    SailorRoute(
      name: RouteConfig.PRODUKSI_LOGISTICS,
      builder: (context, args, params) {
        return LogisticsScreen();
      },
    ),
    SailorRoute(
      name: RouteConfig.PRODUKSI_LOGISTICS_KAPTEN,
      builder: (context, args, params) {
        return LogisticsKaptenScreen();
      },
    ),
    SailorRoute(
      name: RouteConfig.PRODUKSI_LOGISTICS_PENJUALAN,
      builder: (context, args, params) {
        return LogisticsPenjualanScreen();
      },
    ),
    SailorRoute(
      name: RouteConfig.PRODUKSI_LOGISTICS_UPDATE,
      builder: (context, args, params) {
        return LogisticsUpdateScreen();
      },
    ),
    SailorRoute(
      name: RouteConfig.PRODUKSI_MATERIALS,
      builder: (context, args, params) {
        return MaterialsScreen();
      },
    ),
    SailorRoute(
      name: RouteConfig.PRODUKSI_MATERIALS_DASHBOARD,
      builder: (context, args, params) {
        return MaterialsDashboardScreen();
      },
    ),
    SailorRoute(
      name: RouteConfig.PRODUKSI_MATERIALS_DATA_OUTLET,
      builder: (context, args, params) {
        return MaterialsOutletScreen();
      },
    ),
    SailorRoute(
      name: RouteConfig.PRODUKSI_MATERIALS_GRUP,
      builder: (context, args, params) {
        return MaterialsGrupScreen();
      },
    ),
  ];

  static void navigateProduksi(BuildContext context,
      {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.PRODUKSI, (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.PRODUKSI);
    }
  }

  static void navigateProduksiAnalytics(BuildContext context,
      {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.PRODUKSI_ANALYTICS, (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.PRODUKSI_ANALYTICS);
    }
  }

  static void navigateProduksiOutlet(BuildContext context,
      {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.PRODUKSI_OUTLET, (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.PRODUKSI_OUTLET);
    }
  }

  static void navigateProduksiQuality(BuildContext context,
      {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.PRODUKSI_QUALITY, (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.PRODUKSI_QUALITY);
    }
  }

  static void navigateProduksiCentral(BuildContext context,
      {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.PRODUKSI_CENTRAL, (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.PRODUKSI_CENTRAL);
    }
  }

  static void navigateProduksiLogistics(BuildContext context,
      {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.PRODUKSI_LOGISTICS, (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.PRODUKSI_LOGISTICS);
    }
  }

  static void navigateProduksiLogisticsKapten(BuildContext context,
      {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.PRODUKSI_LOGISTICS_KAPTEN,
          (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.PRODUKSI_LOGISTICS_KAPTEN);
    }
  }

  static void navigateProduksiLogisticsPenjualan(BuildContext context,
      {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.PRODUKSI_LOGISTICS_PENJUALAN,
          (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.PRODUKSI_LOGISTICS_PENJUALAN);
    }
  }

  static void navigateProduksiLogisticsUpdate(BuildContext context,
      {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.PRODUKSI_LOGISTICS_UPDATE,
          (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.PRODUKSI_LOGISTICS_UPDATE);
    }
  }

  static void navigateProduksiMaterials(BuildContext context,
      {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.PRODUKSI_MATERIALS, (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.PRODUKSI_MATERIALS);
    }
  }

  static void navigateProduksiMaterialsDashboard(BuildContext context,
      {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.PRODUKSI_MATERIALS_DASHBOARD,
          (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.PRODUKSI_MATERIALS_DASHBOARD);
    }
  }

  static void navigateProduksiMaterialsDataOutlet(BuildContext context,
      {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.PRODUKSI_MATERIALS_DATA_OUTLET,
          (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.PRODUKSI_MATERIALS_DATA_OUTLET);
    }
  }

  static void navigateProduksiMaterialsGrup(BuildContext context,
      {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.PRODUKSI_MATERIALS_GRUP, (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.PRODUKSI_MATERIALS_GRUP);
    }
  }
}
