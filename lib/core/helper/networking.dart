import 'package:dio/dio.dart';
import 'package:nelongso_app/core/constant/Consts.dart';

class Networking {
  Future<Dio> dio() async {
    BaseOptions options = new BaseOptions(
      baseUrl: Constanta.BASE_API,
      // connectTimeout: 10000,
      // receiveTimeout: 6000,
    );
    Dio dio = new Dio(options);
    dio.interceptors.add(LogInterceptor());
    return dio;
  }

  Future<void> cancel(String url, String method) async {
    BaseOptions options = new BaseOptions(
      baseUrl: Constanta.BASE_API,
      // connectTimeout: 10000,
      // receiveTimeout: 6000,
    );
    Dio dio = new Dio(options);
    dio.interceptors.add(LogInterceptor());
    method = method.toLowerCase();
    CancelToken token = CancelToken();

    token.cancel("cancelled");

    if (method == 'get') {
      await Future.wait([
        dio
            .post(url, cancelToken: token)
            .then((response) => print('${response.request.path}: succeed!'))
            .catchError(
          (e) {
            if (CancelToken.isCancel(e)) {
              print('$url: $e');
            }
          },
        ),
      ]);
    } else if (method == 'post') {
      await Future.wait([
        dio
            .post(url, cancelToken: token)
            .then((response) => print('${response.request.path}: succeed!'))
            .catchError(
          (e) {
            if (CancelToken.isCancel(e)) {
              print('$url: $e');
            }
          },
        ),
      ]);
    }
  }
}
