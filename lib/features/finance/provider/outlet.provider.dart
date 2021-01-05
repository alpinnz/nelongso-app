import 'package:dio/dio.dart';
import 'package:nelongso_app/config/dio.client.singleton.dart';
import 'package:nelongso_app/core/helper/InspectTool.dart';
import 'package:nelongso_app/features/finance/model/outlet.model.dart';

String _url = '';

class OutletProvider {
  var _dio = DioClientSingleton().dio;
  Future<dynamic> fetchList({String year}) async {
    try {
      _url = '/api/v1/division/keuangan/outlet-profiles/$year';
      Response response = await _dio.get(_url);
      shout('fetchOutletList', response);

      if (response != null && response.data['name'] != null) {
        String name = '${response.data['name']}'.toLowerCase();
        if (name == 'success') {
          return (response.data['data'] as List)
              .map((x) => OutletModel.fromJson(x))
              .toList();
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
