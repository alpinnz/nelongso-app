import 'package:nelongso_app/features/finance/provider/analytics.provider.dart';
import 'package:nelongso_app/features/finance/provider/noncash.provider.dart';
import 'package:nelongso_app/features/finance/provider/outlet.provider.dart';

class FinanceRepository {
  final _outletProvider = OutletProvider();
  final _analyticsProvider = AnalyticsProvider();
  final _noncashProvider = NoncashProvider();

  Future<dynamic> fetchOutletList() async {
    dynamic data = await _outletProvider.fetchList();
    return data;
  }

  Future<dynamic> fetchAnalyticsList({String sheet, String year}) async {
    dynamic data = await _analyticsProvider.fetchList(sheet: sheet, year: year);
    return data;
  }

  Future<dynamic> fetchNoncashList(
      {String sheet, String year, String month}) async {
    dynamic data = await _noncashProvider.fetchList(
        sheet: sheet, year: year, month: month);
    return data;
  }
}

class NetworkError extends Error {}
