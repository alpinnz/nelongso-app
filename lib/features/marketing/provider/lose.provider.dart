import 'package:dio/dio.dart';
import 'package:nelongso_app/config/dio.client.singleton.dart';
import 'package:nelongso_app/core/helper/InspectTool.dart';
import 'package:nelongso_app/features/marketing/model/lose.menu.dart';
import 'package:nelongso_app/features/marketing/model/lose.outlet.model.dart';
import 'package:nelongso_app/features/marketing/model/lose.rekap.model.dart';

String _url = '';

class LoseProvider {
  var _dio = DioClientSingleton().dio;
  Future<dynamic> fetchList({String sheet, String year, String month}) async {
    _url = '/api/v1/division/marketing/sales/lose-sale/$sheet/$year/$month';

    try {
      Response response = await _dio.get(_url);
      shout('fetchAllLoseSaleList', response);

      if (response != null && response.data['name'] != null) {
        String name = '${response.data['name']}'.toLowerCase();
        if (name == 'success') {
          if (sheet == 'REKAP OUTLET') {
            return (response.data['data'] as List)
                .map((x) => LoseRekapModel.fromJson(x))
                .toList();
          } else if (sheet == 'OUTLET') {
            return (response.data['data'] as List)
                .map((x) => LoseOutletModel.fromJson(x))
                .toList();
          } else if (sheet == 'MENU') {
            return (response.data['data'] as List)
                .map((x) => LoseMenuModel.fromJson(x))
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
