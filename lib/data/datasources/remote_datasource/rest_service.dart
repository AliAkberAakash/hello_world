import 'package:dio/dio.dart';
import 'package:hello_world/core/network/dio_factory.dart';

class RestService {
  final DioFactory _dioFactory;

  RestService(this._dioFactory);

  Future<Response> getMessage() {
    return _dioFactory.getDio().get("http://api.alquran.cloud/v1/surah");
  }

}