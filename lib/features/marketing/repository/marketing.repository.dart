import 'package:nelongso_app/features/marketing/provider/analytics.provider.dart';
import 'package:nelongso_app/features/marketing/provider/ketercapaian.provider.dart';
import 'package:nelongso_app/features/marketing/provider/lose.provider.dart';
import 'package:nelongso_app/features/marketing/provider/potensial.provider.dart';
import 'package:nelongso_app/features/marketing/provider/trend.provider.dart';

class MarketingRepository {
  final _ketercapaianProvider = KetercapaianProvider();
  final _potensialProvider = PotensialProvider();
  final _trendProvider = TrendProvider();
  final _analyticsProvider = AnalyticsProvider();
  final _loseProvider = LoseProvider();

  Future<dynamic> fetchKetercapaianList(
      {String sheet, String year, String month}) async {
    dynamic data = await _ketercapaianProvider.fetchList(
        sheet: sheet, year: year, month: month);
    return data;
  }

  Future<dynamic> fetchLoseList(
      {String sheet, String year, String month}) async {
    dynamic data =
        await _loseProvider.fetchList(sheet: sheet, year: year, month: month);
    return data;
  }

  Future<dynamic> fetchAnalyticsList(
      {String sheet, String year, String month}) async {
    dynamic data = await _analyticsProvider.fetchList(sheet: sheet, year: year);
    return data;
  }

  Future<dynamic> fetchPotensialList(
      {String sheet, String year, String month}) async {
    dynamic data = await _potensialProvider.fetchList(
        sheet: sheet, year: year, month: month);
    return data;
  }

  Future<dynamic> fetchTrendList(
      {String sheet, String year, String month}) async {
    dynamic data = await _trendProvider.fetchList(sheet: sheet, year: year);
    return data;
  }
}

class NetworkError extends Error {}
