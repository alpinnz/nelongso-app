import 'package:dio/dio.dart';
import 'package:nelongso_app/config/dio.client.singleton.dart';
import 'package:nelongso_app/core/helper/InspectTool.dart';
import 'package:nelongso_app/features/marketing/model/potensial.regional.model.dart';

String _url = '';

class PotensialProvider {
  var _dio = DioClientSingleton().dio;
  Future<dynamic> fetchList({String sheet, String year, String month}) async {
    _url = '/api/v1/division/marketing/sales/potensial/$sheet/$year/$month';

    try {
      Response response = await _dio.get(_url);
      shout('fetchAllPotensialList', response);
      if (response != null && response.data['name'] != null) {
        String name = '${response.data['name']}'.toLowerCase();
        if (name == 'success') {
          if (sheet == 'JATIM 1' ||
              sheet == 'JATIM 2' ||
              sheet == 'JATIM 3' ||
              sheet == 'JABAR') {
            return (response.data['data'] as List)
                .map((x) => PotensialRegionalModel.fromJson(x))
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
