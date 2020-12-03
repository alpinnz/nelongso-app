import 'package:nelongso_app/features/auth/routes/auth.route.dart';
import 'package:nelongso_app/features/bisdev/routes/bisdev.route.dart';
import 'package:nelongso_app/features/finance/routes/finance.route.dart';
import 'package:nelongso_app/features/home/routes/home.route.dart';
import 'package:nelongso_app/features/init/route/init.route.dart';
import 'package:nelongso_app/features/marketing/routes/marketing.route.dart';
import 'package:sailor/sailor.dart';

class RouteConfig {
  //INIT routes
  static const INIT = '/';
  static const SPLASH = '/splash';

  //AUTH routes
  static const AUTH_LOGIN = '/auth/login';
  static const AUTH_LOGOUT = '/auth/logout';
  static const AUTH_FORGOT_PASSWORD = '/auth/forgot-password';
  static const AUTH_REGISTER = '/auth/register';

  //HOME routes
  static const HOME = '/home';

  //BISDEV routes
  static const BISDEV = '/bisdev';
  static const BISDEV_INVESTOR = '/bisdev/investor';
  static const BISDEV_INVESTOR_DETAIL = '/bisdev/investo/detail';
  static const BISDEV_OUTLET = '/bisdev/outlet';

  //FINANCE routes
  static const FINANCE = '/finance';
  static const FINANCE_GENERAL = '/finance/general';
  static const FINANCE_GENERAL_NONCASH = '/finance/general/noncash';
  static const FINANCE_GENERAL_REGIONAL = '/finance/general/regional';
  static const FINANCE_GENERAL_ALLREGIONAL = '/finance/general/allregional';
  static const FINANCE_ANALYTICS = '/finance/analytics';
  static const FINANCE_OUTLET = '/finance/outlet';

  //MARKETING routes
  static const MARKETING = '/marketing';
  static const MARKETING_SALES = '/marketing/sales';
  static const MARKETING_SALES_KETERCAPAIAN = '/marketing/sales/ketercapaian';
  static const MARKETING_SALES_POTENSIAL = '/marketing/sales/potensial';
  static const MARKETING_SALES_TRENDOMZET = '/marketing/sales/trendomzet';
  static const MARKETING_SALES_LOSESALE = '/marketing/sales/losesale';
  static const MARKETING_CUSTOMER = '/marketing/customer';
  static const MARKETING_ANALYTICS = '/marketing/analytics';

  static void configureMainRoutes(Sailor router) {
    router.addRoutes(RouteConfigInit.routes);
    router.addRoutes(RouteConfigAuth.routes);
    router.addRoutes(RouteConfigHome.routes);
    router.addRoutes(RouteConfigBisdev.routes);
    router.addRoutes(RouteConfigFinance.routes);
    router.addRoutes(RouteConfigMarketing.routes);
  }
}
