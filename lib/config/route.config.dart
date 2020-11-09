import 'package:nelongso_app/features/init/routes/init.route.dart';
import 'package:sailor/sailor.dart';

class RouteConfig {
  //first check routes
  static const INIT_ROUTE = '/';
  static const SPLASH_ROUTE = '/splash';

  static void configureMainRoutes(Sailor router) {
    router.addRoutes(RouteConfigInit.routes);
  }
}
