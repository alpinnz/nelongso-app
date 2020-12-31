import 'package:dio/dio.dart';
import 'package:nelongso_app/config/dio.client.singleton.dart';
import 'package:nelongso_app/core/helper/InspectTool.dart';
import 'package:nelongso_app/features/marketing/model/analytics.model.dart';

String _url = '';

class AnalyticsProvider {
  var _dio = DioClientSingleton().dio;
  Future<dynamic> fetchList({String sheet, String year}) async {
    _url = '/api/v1/division/marketing/analytics/$sheet/$year';

    try {
      Response response = await _dio.get(_url);
      shout('fetchAllAnalyticsList', response);

      if (response != null && response.data['name'] != null) {
        String name = '${response.data['name']}'.toLowerCase();
        if (name == 'success') {
          if (sheet == 'TARGET OMZET' ||
              sheet == 'TARGET KUNJUNGAN' ||
              sheet == 'TARGET BASKET SIZE') {
            return (response.data['data'] as List)
                .map((x) => AnalyticsModel.fromJson(x))
                .toList();
          }
        } else {
          return response.data['message'];
        }
      }
      return null;
    } catch (_) {
      return null;
    }
  }

  void dispose() {
    CancelToken token = CancelToken();
    _dio.get(_url, cancelToken: token);
    token.cancel("cancelled");
  }
}
