import 'package:nelongso_app/features/auth/routes/auth.route.dart';
import 'package:nelongso_app/features/bisdev/routes/bisdev.route.dart';
import 'package:nelongso_app/features/finance/routes/finance.route.dart';
import 'package:nelongso_app/features/home/routes/home.route.dart';
import 'package:nelongso_app/features/hrd/routes/hrd.route.dart';
import 'package:nelongso_app/features/marketing/routes/marketing.route.dart';
import 'package:nelongso_app/features/operasional/routes/operasional.route.dart';
import 'package:nelongso_app/features/produksi/routes/produksi.route.dart';
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

  //OPERASIONAL routes
  static const OPERASIONAL = '/operasional';
  static const OPERASIONAL_GENERAL = '/operasional/general';
  static const OPERASIONAL_GENERAL_INVENTARIS =
      '/operasional/general/inventaris';
  static const OPERASIONAL_GENERAL_CLEANING = '/operasional/general/cleaning';
  static const OPERASIONAL_GENERAL_PENILAIAN = '/operasional/general/penilaian';
  static const OPERASIONAL_MAINTENANCE = '/operasional/maintenance';
  static const OPERASIONAL_TRAINING = '/operasional/training';
  static const OPERASIONAL_ANALYTICS = '/operasional/analytics';

  //PRODUKSI routes
  static const PRODUKSI = '/produksi';
  static const PRODUKSI_LOGISTICS = '/produksi/logistics';
  static const PRODUKSI_LOGISTICS_PENJUALAN = '/produksi/logistics/penjualan';
  static const PRODUKSI_LOGISTICS_KAPTEN = '/produksi/logistics/kapten';
  static const PRODUKSI_LOGISTICS_UPDATE = '/produksi/logistics/update';
  static const PRODUKSI_MATERIALS = '/produksi/materials';
  static const PRODUKSI_MATERIALS_DASHBOARD = '/produksi/materials/dashboard';
  static const PRODUKSI_MATERIALS_GRUP = '/produksi/materials/grup-menu';
  static const PRODUKSI_MATERIALS_DATA_OUTLET =
      '/produksi/materials/data-outlet';
  static const PRODUKSI_QUALITY = '/produksi/quality-management';
  static const PRODUKSI_CENTRAL = '/produksi/central-kitchen-management';
  static const PRODUKSI_OUTLET = '/produksi/outlet-profiles';
  static const PRODUKSI_ANALYTICS = '/produksi/analytics';

  //HRD routes
  static const HRD = '/hrd';
  static const HRD_PERSONAL = '/hrd/personal';
  static const HRD_PERSONAL_KARYAWAN = '/hrd/personal/karyawan';
  static const HRD_PERSONAL_TUNJANGAN = '/hrd/personal/tunjangan';
  static const HRD_PERSONAL_BPJS = '/hrd/personal/bpjs';
  static const HRD_PERSONAL_KASBON = '/hrd/personal/kasbon';
  static const HRD_ANALYTICS = '/hrd/analytics';
  static const HRD_ANALYTICS_RAPORT = '/hrd/analytics/raport';
  static const HRD_ANALYTICS_PRODUKTIVITAS = '/hrd/analytics/produktivitas';
  static const HRD_PAYROLL = '/hrd/payroll';
  static const HRD_PAYROLL_SDM = '/hrd/payroll/sdm';
  static const HRD_PAYROLL_GRADE = '/hrd/payroll/grade';
  static const HRD_RECRUITMENT = '/hrd/recruitment';
  static const HRD_RECRUITMENT_SDM = '/hrd/recruitment/sdm';
  static const HRD_RECRUITMENT_PELAMAR = '/hrd/recruitment/pelamar-masuk';
  static const HRD_RECRUITMENT_SELEKSI = '/hrd/recruitment/seleksi-pelamar';
  static const HRD_RECRUITMENT_INTERVIEW = '/hrd/recruitment/interview';

  static void configureMainRoutes(Sailor router) {
    router.addRoutes(RouteConfigAuth.routes);
    router.addRoutes(RouteConfigHome.routes);
    router.addRoutes(RouteConfigBisdev.routes);
    router.addRoutes(RouteConfigFinance.routes);
    router.addRoutes(RouteConfigMarketing.routes);
    router.addRoutes(RouteConfigOperasional.routes);
    router.addRoutes(RouteConfigProduksi.routes);
    router.addRoutes(RouteConfigHrd.routes);
  }
}
