import 'package:dio/dio.dart';
import 'package:nelongso_app/config/dio.client.singleton.dart';
import 'package:nelongso_app/core/helper/InspectTool.dart';
import 'package:nelongso_app/features/finance/model/regional.hpp.model.dart';
import 'package:nelongso_app/features/finance/model/regional.kunjungan.model.dart';
import 'package:nelongso_app/features/finance/model/regional.menu.model.dart';
import 'package:nelongso_app/features/finance/model/regional.omzetofflineandonline.model.dart';
import 'package:nelongso_app/features/finance/model/regional.omzetpershift.model.dart';
import 'package:nelongso_app/features/finance/model/regional.operasional.model.dart';
import 'package:nelongso_app/features/finance/model/regional.outlet.model.dart';
import 'package:nelongso_app/features/finance/model/regional.persentasekunjungan.model.dart';

String _url = '';

class RegionalProvider {
  var _dio = DioClientSingleton().dio;
  Future<dynamic> fetchList(
      {String regional, String sheet, String year, String month}) async {
    _url =
        '/api/v1/division/keuangan/general/dashboard-regional/$regional/$sheet/$year/$month';
    try {
      Response response = await _dio.get(_url);
      shout('fetchRegionalList', response);
      if (response != null && response.data['name'] != null) {
        String name = '${response.data['name']}'.toLowerCase();
        if (name == 'success') {
          if (sheet == 'REKAP OUTLET BULANAN') {
            return (response.data['data'] as List)
                .map((x) => RegionalOutletModel.fromJson(x))
                .toList();
          } else if (sheet == 'REKAP HPP SUPPLIER') {
            return (response.data['data'] as List)
                .map((x) => RegionalHppModel.fromJson(x))
                .toList();
          } else if (sheet == 'REKAP OMZET OFFLINE & ONLINE') {
            return (response.data['data'] as List)
                .map((x) => RegionalOmzetofflineandonlineModel.fromJson(x))
                .toList();
          } else if (sheet == 'REKAP KUNJUNGAN') {
            return (response.data['data'] as List)
                .map((x) => RegionalKunjunganModel.fromJson(x))
                .toList();
          } else if (sheet == 'PERSENTASE KUNJUNGAN') {
            return (response.data['data'] as List)
                .map((x) => RegionalPersentaseKunjunganModel.fromJson(x))
                .toList();
          } else if (sheet == 'REKAP OPERASIONAL') {
            return (response.data['data'] as List)
                .map((x) => RegionalOperasionalModel.fromJson(x))
                .toList();
          } else if (sheet == 'REKAP OMZET PER SHIFT') {
            return (response.data['data'] as List)
                .map((x) => RegionalOmzetpershiftModel.fromJson(x))
                .toList();
          } else if (sheet == 'REKAP MENU YANG TERJUAL') {
            return (response.data['data'] as List)
                .map((x) => RegionalMenuModel.fromJson(x))
                .toList();
          }
        } else {
          return response.data['message'].toString();
        }
      }

      return null;
    } on DioError catch (_) {
      return null;
    }
  }

  void dispose() {
    CancelToken token = CancelToken();
    _dio.get(_url, cancelToken: token);
    token.cancel("cancelled");
  }
}
