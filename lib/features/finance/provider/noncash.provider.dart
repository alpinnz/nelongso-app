import 'package:dio/dio.dart';
import 'package:nelongso_app/config/dio.client.singleton.dart';
import 'package:nelongso_app/core/helper/InspectTool.dart';
import 'package:nelongso_app/features/finance/model/noncash.gojekandgrab.model.dart';
import 'package:nelongso_app/features/finance/model/noncash.goresto.model.dart';
import 'package:nelongso_app/features/finance/model/noncash.grabresto.model.dart';
import 'package:nelongso_app/features/finance/model/noncash.saldogoresto.model.dart';
import 'package:nelongso_app/features/finance/model/noncash.saldograbresto.model.dart';

String _url = '';

class NoncashProvider {
  var _dio = DioClientSingleton().dio;
  Future<dynamic> fetchList({String sheet, String year, String month}) async {
    _url =
        '/api/v1/division/keuangan/general/dashboard-non-cash/$sheet/$year/$month';

    try {
      Response response = await _dio.get(_url);
      shout('fetchNonCashList', response);
      if (response != null && response.data['name'] != null) {
        String name = '${response.data['name']}'.toLowerCase();
        if (name == 'success') {
          if (sheet == 'GORESTO') {
            return (response.data['data'] as List)
                .map((x) => NoncashGorestoModel.fromJson(x))
                .toList();
          } else if (sheet == 'GRABRESTO') {
            return (response.data['data'] as List)
                .map((x) => NoncashGrabrestoModel.fromJson(x))
                .toList();
          } else if (sheet == 'GOJEK & GRAB') {
            return (response.data['data'] as List)
                .map((x) => NoncashGojekandgrabModel.fromJson(x))
                .toList();
          } else if (sheet == 'SALDO GRABRESTO') {
            return (response.data['data'] as List)
                .map((x) => NoncashSaldograbrestoModel.fromJson(x))
                .toList();
          } else if (sheet == 'SALDO GORESTO') {
            return (response.data['data'] as List)
                .map((x) => NoncashSaldogorestoModel.fromJson(x))
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
