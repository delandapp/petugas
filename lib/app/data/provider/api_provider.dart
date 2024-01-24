import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';


class ApiProvider {
  static late Dio _dio;


  static Dio instance() {
    _dio = Dio();
    _dio.interceptors.add(PrettyDioLogger(
        requestHeader: kDebugMode,
        requestBody: kDebugMode,
        responseBody: kDebugMode,
        responseHeader: false,
        error: kDebugMode,
        compact: kDebugMode,
        maxWidth: 90));
    return _dio;
  }
}
