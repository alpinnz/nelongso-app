import 'package:dio/dio.dart';
import 'package:nelongso_app/config/dio.client.singleton.dart';
import 'package:nelongso_app/core/helper/InspectTool.dart';
import 'package:nelongso_app/features/bisdev/model/investor.model.dart';

String _url = '';

class InvestorProvider {
  var _dio = DioClientSingleton().dio;
  Future<dynamic> fetchList({String year}) async {
    _url = '/api/v1/division/bisdev/investor-management/$year';
    try {
      Response response = await _dio.get(_url);
      shout('fetchInvestoryList', response);
      if (response.statusCode == 200) {
        return (response.data['data'] as List)
            .map((x) => InvestorModel.fromJson(x))
            .toList();
      }
      return null;
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
