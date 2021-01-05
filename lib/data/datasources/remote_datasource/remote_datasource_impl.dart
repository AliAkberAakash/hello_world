import 'package:flutter/cupertino.dart';
import 'remote_datasource.dart';
import 'rest_service.dart';
import '../../models/message_response.dart';

class RemoteDataSourceImpl extends RemoteDataSource{

  final RestService service;

  RemoteDataSourceImpl({@required this.service});

  @override
  Future<MessageResponse> getMessage() {
    return service.getMessage().then((value){
      return MessageResponse.fromJson(value);
    });
  }

}