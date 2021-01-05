import 'dart:async';

import 'local_datasource.dart';
import '../../models/message_response.dart';
import '../../../utils/constants.dart';
import '../../../utils/shared_pref_utils.dart';

class LocalDataSourceImpl implements LocalDataSource {
  @override
  Future<MessageResponse> getMessageResponse() async{

    String message = await SharedPrefUtil.getString(MyConstants.MESSAGE_KEY);
    if(message.isEmpty) message = "Hello world!"; //for the first time
    return MessageResponse(success: true, message: message);
  }

  @override
  void setMessageResponse(MessageResponse response) async{
    await SharedPrefUtil.writeString(MyConstants.MESSAGE_KEY, response.message);
  }

}