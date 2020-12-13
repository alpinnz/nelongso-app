import 'package:dio/dio.dart';
import 'package:nelongso_app/config/dio.client.singleton.dart';
import 'package:nelongso_app/core/helper/InspectTool.dart';
import 'package:nelongso_app/features/finance/model/allregional.biaya.model.dart';
import 'package:nelongso_app/features/finance/model/allregional.data.model.dart';
import 'package:nelongso_app/features/finance/model/allregional.final.model.dart';
import 'package:nelongso_app/features/finance/model/allregional.pph.model.dart';
import 'package:nelongso_app/features/finance/model/allregional.share.model.dart';
import 'package:nelongso_app/features/finance/model/allregional.weak.model.dart';

String _url = '';

class AllregionalProvider {
  var _dio = DioClientSingleton().dio;
  Future<dynamic> fetchList({String sheet, String year, String month}) async {
    _url = '/division/keuangan/general/score-all-regional/$sheet/$year/$month';
    try {
      Response response = await _dio.get(_url);
      shout('fetchAllRegionalList', response);
      if (response.statusCode == 200) {
        if (sheet == 'DATA') {
          return (response.data['data'] as List)
              .map((x) => AllregionalDataModel.fromJson(x))
              .toList();
        } else if (sheet == 'SHARE PROFIT & BEP') {
          return (response.data['data'] as List)
              .map((x) => AllregionalShareModel.fromJson(x))
              .toList();
        } else if (sheet == 'MINGGU 1' ||
            sheet == 'MINGGU 2' ||
            sheet == 'MINGGU 3' ||
            sheet == 'MINGGU 4' ||
            sheet == 'MINGGU 5') {
          return (response.data['data'] as List)
              .map((x) => AllregionalWeakModel.fromJson(x))
              .toList();
        } else if (sheet == 'BIAYA TAMBAHAN') {
          return (response.data['data'] as List)
              .map((x) => AllregionalBiayaModel.fromJson(x))
              .toList();
        } else if (sheet == 'FINAL') {
          return (response.data['data'] as List)
              .map((x) => AllregionalFinalModel.fromJson(x))
              .toList();
        } else if (sheet == 'PPH') {
          return (response.data['data'] as List)
              .map((x) => AllregionalPphModel.fromJson(x))
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
