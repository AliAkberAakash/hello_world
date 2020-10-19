import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hello_world/core/failure/exceptions/network_exception.dart';
import 'package:hello_world/utils/constants.dart';

import 'dio_factory.dart';

class ApiBaseHelper{

  final DioFactory _dioFactory;

  ApiBaseHelper(this._dioFactory);

  Future<dynamic> get(String endUrl, dynamic header) async {
    var responseJson;
    try {
      // add headers
      _dioFactory.getDio().options.headers = header;
      // make the network call
      final response = await _dioFactory.getDio().get(NetworkConstants.BASE_URL+endUrl);
      //return the response
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

}

dynamic _returnResponse(Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = json.decode(response.data.toString());
      return responseJson;
    case 400:
      var responseJson = json.decode(response.data.toString());
      throw BadRequestException(responseJson["message"].toString());
    case 401:
    case 403:
      var responseJson = json.decode(response.data.toString());
      throw UnauthorisedException(responseJson["message"].toString());
    case 500:
    default:
      throw FetchDataException('Error occurred while Communication with '
          'Server with StatusCode : ${response.statusCode}');
  }
}