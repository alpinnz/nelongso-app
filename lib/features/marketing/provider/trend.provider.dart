import 'package:dio/dio.dart';
import 'package:nelongso_app/config/dio.client.singleton.dart';
import 'package:nelongso_app/core/helper/InspectTool.dart';
import 'package:nelongso_app/features/marketing/model/trend.month.model.dart';
import 'package:nelongso_app/features/marketing/model/trend.omzet.model.dart';
import 'package:nelongso_app/features/marketing/model/trend.omzet.year.model.dart';

String _url = '';

class TrendProvider {
  var _dio = DioClientSingleton().dio;
  Future<dynamic> fetchList({String sheet, String year}) async {
    _url = '/division/marketing/sales/trend-omset/$sheet/$year';
    try {
      Response response = await _dio.get(_url);
      shout('fetchAllKetercapaianList', response);

      if (response.statusCode == 200) {
        if (sheet == 'TREND OMZET') {
          return (response.data['data'] as List)
              .map((x) => TrendOmzetModel.fromJson(x))
              .toList();
        } else if (sheet == 'TREND OMZET OUTLET PER TAHUN') {
          return (response.data['data'] as List)
              .map((x) => TrendOmzetYearModel.fromJson(x))
              .toList();
        } else if (sheet == 'JANUARI' ||
            sheet == 'FEBRUARI' ||
            sheet == 'MARET' ||
            sheet == 'APRIL' ||
            sheet == 'MEI' ||
            sheet == 'JUNI' ||
            sheet == 'JULI' ||
            sheet == 'AGUSTUS' ||
            sheet == 'SEPTEMBER' ||
            sheet == 'OKTOBER' ||
            sheet == 'NOVEMBER' ||
            sheet == 'DESEMBER') {
          return (response.data['data'] as List)
              .map((x) => TrendMonthModel.fromJson(x))
              .toList();
        }
      }
      return 'Data not found or connection error';
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return 'Data not found or connection error';
    }
  }

  void dispose() {
    CancelToken token = CancelToken();
    _dio.get(_url, cancelToken: token);
    token.cancel("cancelled");
  }
}
