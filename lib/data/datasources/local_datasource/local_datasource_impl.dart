import 'dart:async';

import 'package:hello_world/data/datasources/local_datasource/local_datasource.dart';
import 'package:hello_world/data/models/message_response.dart';
import 'package:hello_world/utils/constants.dart';
import 'package:hello_world/utils/shared_pref_utils.dart';

class LocalDataSourceImpl implements LocalDataSource {
  @override
  Future<MessageResponse> getMessageResponse() async{

    final message = await SharedPrefUtil.getString(MyConstants.MESSAGE_KEY);
    return MessageResponse(success: true, message: message);
  }

  @override
  void setMessageResponse(MessageResponse response) async{
    await SharedPrefUtil.writeString(MyConstants.MESSAGE_KEY, response.message);
  }

}