import 'package:flutter/material.dart';
import 'package:nelongso_app/config/route.config.dart';
import 'package:nelongso_app/core/app.dart';
import 'package:nelongso_app/features/hrd/screen/analytics.produktivitas.screen.dart';
import 'package:nelongso_app/features/hrd/screen/analytics.raport.screen.dart';
import 'package:nelongso_app/features/hrd/screen/analytics.screen.dart';
import 'package:nelongso_app/features/hrd/screen/hrd.screen.dart';
import 'package:nelongso_app/features/hrd/screen/payroll.grade.screen.dart';
import 'package:nelongso_app/features/hrd/screen/payroll.screen.dart';
import 'package:nelongso_app/features/hrd/screen/payroll.sdm.screen.dart';
import 'package:nelongso_app/features/hrd/screen/personal.bpjs.screen.dart';
import 'package:nelongso_app/features/hrd/screen/personal.karyawan.screen.dart';
import 'package:nelongso_app/features/hrd/screen/personal.kasbon.screen.dart';
import 'package:nelongso_app/features/hrd/screen/personal.screen.dart';
import 'package:nelongso_app/features/hrd/screen/personal.tunjangan.screen.dart';
import 'package:nelongso_app/features/hrd/screen/recruitment.interview.screen.dart';
import 'package:nelongso_app/features/hrd/screen/recruitment.pelamar.screen.dart';
import 'package:nelongso_app/features/hrd/screen/recruitment.screen.dart';
import 'package:nelongso_app/features/hrd/screen/recruitment.sdm.screen.dart';
import 'package:nelongso_app/features/hrd/screen/recruitment.seleksi.screen.dart';
import 'package:sailor/sailor.dart';

class RouteConfigHrd {
  static final List<SailorRoute> routes = <SailorRoute>[
    SailorRoute(
      name: RouteConfig.HRD,
      builder: (context, args, params) {
        return HrdScreen();
      },
    ),
    SailorRoute(
      name: RouteConfig.HRD_ANALYTICS,
      builder: (context, args, params) {
        return AnalyticsScreen();
      },
    ),
    SailorRoute(
      name: RouteConfig.HRD_ANALYTICS_PRODUKTIVITAS,
      builder: (context, args, params) {
        return AnalyticsProduktivitasScreen();
      },
    ),
    SailorRoute(
      name: RouteConfig.HRD_ANALYTICS_RAPORT,
      builder: (context, args, params) {
        return AnalyticsRaportScreen();
      },
    ),
    SailorRoute(
      name: RouteConfig.HRD_PAYROLL,
      builder: (context, args, params) {
        return PayrollScreen();
      },
    ),
    SailorRoute(
      name: RouteConfig.HRD_PAYROLL_GRADE,
      builder: (context, args, params) {
        return PayrollGradeScreen();
      },
    ),
    SailorRoute(
      name: RouteConfig.HRD_PAYROLL_SDM,
      builder: (context, args, params) {
        return PayrollSdmScreen();
      },
    ),
    SailorRoute(
      name: RouteConfig.HRD_PERSONAL,
      builder: (context, args, params) {
        return PersonalScreen();
      },
    ),
    SailorRoute(
      name: RouteConfig.HRD_PERSONAL_KARYAWAN,
      builder: (context, args, params) {
        return PersonalKaryawanScreen();
      },
    ),
    SailorRoute(
      name: RouteConfig.HRD_PERSONAL_KASBON,
      builder: (context, args, params) {
        return PersonalKasbonScreen();
      },
    ),
    SailorRoute(
      name: RouteConfig.HRD_PERSONAL_TUNJANGAN,
      builder: (context, args, params) {
        return PersonalTunjanganScreen();
      },
    ),
    SailorRoute(
      name: RouteConfig.HRD_PERSONAL_BPJS,
      builder: (context, args, params) {
        return PersonalBpjsScreen();
      },
    ),
    SailorRoute(
      name: RouteConfig.HRD_RECRUITMENT,
      builder: (context, args, params) {
        return RecruitmentScreen();
      },
    ),
    SailorRoute(
      name: RouteConfig.HRD_RECRUITMENT_INTERVIEW,
      builder: (context, args, params) {
        return RecruitmentInterviewScreen();
      },
    ),
    SailorRoute(
      name: RouteConfig.HRD_RECRUITMENT_PELAMAR,
      builder: (context, args, params) {
        return RecruitmentPelamarScreen();
      },
    ),
    SailorRoute(
      name: RouteConfig.HRD_RECRUITMENT_SDM,
      builder: (context, args, params) {
        return RecruitmentSdmScreen();
      },
    ),
    SailorRoute(
      name: RouteConfig.HRD_RECRUITMENT_SELEKSI,
      builder: (context, args, params) {
        return RecruitmentSeleksiScreen();
      },
    ),
  ];

  static void navigateHrd(BuildContext context, {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.HRD, (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.HRD);
    }
  }

  static void navigatePersonal(BuildContext context,
      {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.HRD_PERSONAL, (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.HRD_PERSONAL);
    }
  }

  static void navigatePersonalBpjs(BuildContext context,
      {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.HRD_PERSONAL_BPJS, (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.HRD_PERSONAL_BPJS);
    }
  }

  static void navigatePersonalKasbon(BuildContext context,
      {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.HRD_PERSONAL_KASBON, (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.HRD_PERSONAL_KASBON);
    }
  }

  static void navigatePersonalKaryawan(BuildContext context,
      {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.HRD_PERSONAL_KARYAWAN, (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.HRD_PERSONAL_KARYAWAN);
    }
  }

  static void navigatePersonalTunjangan(BuildContext context,
      {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.HRD_PERSONAL_TUNJANGAN, (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.HRD_PERSONAL_TUNJANGAN);
    }
  }

  static void navigatePayroll(BuildContext context, {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.HRD_PAYROLL, (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.HRD_PAYROLL);
    }
  }

  static void navigatePayrollSdm(BuildContext context,
      {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.HRD_PAYROLL_SDM, (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.HRD_PAYROLL_SDM);
    }
  }

  static void navigatePayrollGrade(BuildContext context,
      {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.HRD_PAYROLL_GRADE, (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.HRD_PAYROLL_GRADE);
    }
  }

  static void navigateAnalytics(BuildContext context,
      {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.HRD_ANALYTICS, (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.HRD_ANALYTICS);
    }
  }

  static void navigateAnalyticsProduktivitas(BuildContext context,
      {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.HRD_ANALYTICS_PRODUKTIVITAS,
          (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.HRD_ANALYTICS_PRODUKTIVITAS);
    }
  }

  static void navigateAnalyticsRaport(BuildContext context,
      {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.HRD_ANALYTICS_RAPORT, (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.HRD_ANALYTICS_RAPORT);
    }
  }

  static void navigateRecruitment(BuildContext context,
      {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.HRD_RECRUITMENT, (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.HRD_RECRUITMENT);
    }
  }

  static void navigateRecruitmentInterview(BuildContext context,
      {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.HRD_RECRUITMENT_INTERVIEW,
          (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.HRD_RECRUITMENT_INTERVIEW);
    }
  }

  static void navigateRecruitmentPelamar(BuildContext context,
      {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.HRD_RECRUITMENT_PELAMAR, (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.HRD_RECRUITMENT_PELAMAR);
    }
  }

  static void navigateRecruitmentSdm(BuildContext context,
      {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.HRD_RECRUITMENT_SDM, (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.HRD_RECRUITMENT_SDM);
    }
  }

  static void navigateRecruitmentSeleksi(BuildContext context,
      {bool clearStack = false}) {
    if (clearStack) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConfig.HRD_RECRUITMENT_SELEKSI, (Route<dynamic> route) => false);
    } else {
      App.main.router.navigate(RouteConfig.HRD_RECRUITMENT_SELEKSI);
    }
  }
}
