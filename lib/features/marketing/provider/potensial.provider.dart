import 'package:dio/dio.dart';
import 'package:nelongso_app/config/dio.client.singleton.dart';
import 'package:nelongso_app/core/helper/InspectTool.dart';
import 'package:nelongso_app/features/marketing/model/ketercapaian.regional.model.dart';

String _url = '';

class PotensialProvider {
  var _dio = DioClientSingleton().dio;
  Future<dynamic> fetchList({String sheet, String year, String month}) async {
    _url = '/division/marketing/sales/potensial/$sheet/$year/$month';
    try {
      Response response = await _dio.get(_url);
      shout('fetchAllPotensialList', response);
      if (response.statusCode == 200) {
        if (sheet == 'JATIM 1' ||
            sheet == 'JATIM 2' ||
            sheet == 'JATIM 3' ||
            sheet == 'JABAR') {
          return (response.data['data'] as List)
              .map((x) => KetercapaianRegionalModel.fromJson(x))
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
