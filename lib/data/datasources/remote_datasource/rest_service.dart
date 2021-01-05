import 'package:flutter/cupertino.dart';
import '../../../core/network/api_base_helper.dart';
import '../../../utils/constants.dart';

class RestService {
  final ApiBaseHelper helper;

  RestService({@required this.helper});

  //calls base url
  Future<dynamic> getMessage() {

    final header = {
      NetworkConstants.ACCEPT : "application/json"
    };

    return helper.get("", header);
  }

}