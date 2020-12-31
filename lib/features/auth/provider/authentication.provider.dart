import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:nelongso_app/config/dio.client.singleton.dart';
import 'package:nelongso_app/features/auth/model/account.model.dart';

final String _url = '/authentication/login';

class AuthenticationProvider {
  var _dio = DioClientSingleton().dio;
  Future<dynamic> onLogin(
      {@required String email, @required String password}) async {
    try {
      FormData formData = FormData.fromMap({
        "email": email,
        "password": password,
      });

      Response response = await _dio.post(_url, data: formData);
      if (response != null) {
        if (response.data['name'] == 'Success') {
          return AccountModel.fromJson(response.data['data']);
        } else {
          return response.data['message'];
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

class NetworkError extends Error {}
