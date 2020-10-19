import 'package:dio/dio.dart';

class DioFactory {
  static final DioFactory _singleton = DioFactory._internal();
  Dio _dio;

  factory DioFactory() {
    return _singleton;
  }

  DioFactory._internal() {
    this._dio = Dio();
  }

  Dio getDio() => this._dio;
}