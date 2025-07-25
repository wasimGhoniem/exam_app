import 'package:dio/dio.dart';
import 'package:exam_app/core/api_endpoint/endpoint.dart';
import 'package:exam_app/core/di/di.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
@module
abstract class DioModule {
  @lazySingleton
  Dio provideDio() {
    Dio dio = Dio();
    dio.options.headers = {'content-type': 'application/json'};
    dio.options.baseUrl = Endpoint.baseUrl;
    dio.interceptors.add(getIt<PrettyDioLogger>());
    return dio;
  }

  @lazySingleton
  PrettyDioLogger providePrettyLogger() {
    return PrettyDioLogger(
      requestHeader: true,
      responseHeader: true,
      responseBody: true,
      requestBody: true,
      request: true,

    );
  }
}
