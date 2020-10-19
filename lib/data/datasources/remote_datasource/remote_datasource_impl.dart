import 'package:flutter/cupertino.dart';
import 'package:hello_world/data/datasources/remote_datasource/remote_datasource.dart';
import 'package:hello_world/data/datasources/remote_datasource/rest_service.dart';
import 'package:hello_world/data/models/message_response.dart';

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