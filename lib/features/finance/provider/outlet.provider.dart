import 'package:dio/dio.dart';
import 'package:nelongso_app/config/dio.client.singleton.dart';
import 'package:nelongso_app/core/helper/InspectTool.dart';
import 'package:nelongso_app/features/finance/model/outlet.model.dart';

final String _url = '/division/keuangan/outlet-profiles';

class OutletProvider {
  var _dio = DioClientSingleton().dio;
  Future<dynamic> fetchList() async {
    try {
      Response response = await _dio.get(_url);
      shout('fetchOutletList', response);
      if (response.statusCode == 200) {
        return (response.data['data'] as List)
            .map((x) => OutletModel.fromJson(x))
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
