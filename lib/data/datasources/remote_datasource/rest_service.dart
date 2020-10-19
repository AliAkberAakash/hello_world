import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hello_world/core/network/api_base_helper.dart';
import 'package:hello_world/utils/constants.dart';

class RestService {
  final ApiBaseHelper helper;

  RestService({@required this.helper});

  //calls base url
  Future<Response> getMessage() {

    final header = {
      NetworkConstants.ACCEPT : "application/json"
    };

    return helper.get("", header);
  }

}