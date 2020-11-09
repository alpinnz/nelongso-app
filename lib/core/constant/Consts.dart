class Constanta {
  static const String APP_SCRIPT_BASE = 'https://script.google.com/macros/s';
  static const String DATA_MITRA =
      '/AKfycbxkrCTRO_jio1U2W5iWcvcDAsA6Zfs9F4p-iR3Dmy1QRCQSYHnc/exec';
  static const String DATA_OUTLET =
      '/AKfycbzo2cj18PNRZnFG07BgW_OEhDWXO9BfOn9cCkpn9A/exec';

  static const String API_DATA_MITRA = '$APP_SCRIPT_BASE$DATA_MITRA';
  static const String API_DATA_OUTLET = '$APP_SCRIPT_BASE$DATA_OUTLET';

  static const String BASE_URL = 'https://nelongso-node.herokuapp.com';
  static const String PATH_API = 'api/v1';
  static const String BASE_API = '$BASE_URL/$PATH_API';

  static const String PATH_KEUANGAN_GENERAL_REGIONAL =
      'division/keuangan/general-dashboard-regional';
  static const String PATH_KEUANGAN_GENERAL_NON_CASH =
      'division/keuangan/general-dashboard-non-cash';
  static const String PATH_KEUANGAN_GENERAL_ALL_REGIONAL =
      'division/keuangan/general-scoreboard-all-regional';
  static const String PATH_KEUANGAN_OUTLET_PROFILE =
      'division/keuangan/outlet-profiles';
  static const String PATH_KEUANGAN_FINANCE_ANALYTICS =
      'division/keuangan/finance-analytics';
}
