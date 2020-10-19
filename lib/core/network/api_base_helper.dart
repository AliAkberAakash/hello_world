import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hello_world/core/failure/exceptions/network_exception.dart';
import 'package:hello_world/utils/constants.dart';

import 'dio_factory.dart';

class ApiBaseHelper{

  final DioFactory dioFactory;

  ApiBaseHelper({@required this.dioFactory});

  Future<Response> get(String endUrl, dynamic header) async {
    var responseJson;
    try {
      // add headers
      dioFactory.getDio().options.headers = header;
      // make the network call
      final response = await dioFactory.getDio().get(NetworkConstants.BASE_URL+endUrl);
      //return the response
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

}

Response _returnResponse(Response response) {
  switch (response.statusCode) {
    case 200:
      return response;
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