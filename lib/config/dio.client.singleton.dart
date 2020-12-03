import 'package:dio/dio.dart';
import 'package:nelongso_app/core/constant/Consts.dart';

class DioClientSingleton {
  Dio dio;
  static final DioClientSingleton _singleton =
      new DioClientSingleton._internal();

  factory DioClientSingleton() => _singleton;

  DioClientSingleton._internal() {
    init();
  }

  Future<Null> init() async {
    dio = Dio(
      BaseOptions(
        baseUrl: Constanta.BASE_API,
        // connectTimeout: 10000,
        // receiveTimeout: 10000,
        responseType: ResponseType.json,
      ),
    );
  }
}
