import 'package:dio/dio.dart';
import 'package:nelongso_app/config/dio.client.singleton.dart';
import 'package:nelongso_app/core/helper/InspectTool.dart';
import 'package:nelongso_app/features/marketing/model/ketercapaian.allregional.model.dart';
import 'package:nelongso_app/features/marketing/model/ketercapaian.basket.model.dart';
import 'package:nelongso_app/features/marketing/model/ketercapaian.kunjungan.model.dart';
import 'package:nelongso_app/features/marketing/model/ketercapaian.omzet.model.dart';
import 'package:nelongso_app/features/marketing/model/ketercapaian.outlet.model.dart';
import 'package:nelongso_app/features/marketing/model/ketercapaian.regional.model.dart';
import 'package:nelongso_app/features/marketing/model/ketercapaian.selisih.model.dart';

String _url = '';

class KetercapaianProvider {
  var _dio = DioClientSingleton().dio;
  Future<dynamic> fetchList({String sheet, String year, String month}) async {
    _url = '/division/marketing/sales/ketercapaian/$sheet/$year/$month';
    try {
      Response response = await _dio.get(_url);
      shout('fetchAllKetercapaianList', response);
      if (response.statusCode == 200) {
        if (sheet == 'KETERCAPAIAN OMZET') {
          return (response.data['data'] as List)
              .map((x) => KetercapaianOmzetModel.fromJson(x))
              .toList();
        } else if (sheet == 'KETERCAPAIAN KUNJUNGAN') {
          return (response.data['data'] as List)
              .map((x) => KetercapaianKunjunganModel.fromJson(x))
              .toList();
        } else if (sheet == 'KETERCAPAIAN BASKET SIZE') {
          return (response.data['data'] as List)
              .map((x) => KetercapaianBasketModel.fromJson(x))
              .toList();
        } else if (sheet == 'KETERCAPAIAN JATIM 1' ||
            sheet == 'KETERCAPAIAN JATIM 2' ||
            sheet == 'KETERCAPAIAN JATIM 3' ||
            sheet == 'KETERCAPAIAN JABAR') {
          return (response.data['data'] as List)
              .map((x) => KetercapaianRegionalModel.fromJson(x))
              .toList();
        } else if (sheet == 'KETERCAPAIAN ALL REGIONAL') {
          return (response.data['data'] as List)
              .map((x) => KetercapaianAllregionalModel.fromJson(x))
              .toList();
        } else if (sheet == 'BULAN SEBELUM VS BULAN SEKARANG') {
          return (response.data['data'] as List)
              .map((x) => KetercapaianSelisihModel.fromJson(x))
              .toList();
        } else if (sheet == 'KESEHATAN OUTLET') {
          return (response.data['data'] as List)
              .map((x) => KetercapaianOutletModel.fromJson(x))
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
