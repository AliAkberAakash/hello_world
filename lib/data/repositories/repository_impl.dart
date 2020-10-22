import 'package:flutter/cupertino.dart';
import 'package:hello_world/core/failure/exceptions/network_exception.dart';
import 'package:hello_world/core/network/network_info.dart';
import 'package:hello_world/data/datasources/local_datasource/local_datasource.dart';
import 'package:hello_world/data/datasources/remote_datasource/remote_datasource.dart';
import 'package:hello_world/data/models/message_response.dart';
import 'package:hello_world/data/repositories/repository.dart';

class RepositoryImpl extends Repository{

  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  RepositoryImpl({@required this.remoteDataSource, @required this.networkInfo, @required this.localDataSource});


  @override
  Future<MessageResponse> getMessage() async{
    if(await networkInfo.isConnected) {
      final response = await remoteDataSource.getMessage();
      if (response.success) {
        localDataSource.setMessageResponse(response); //if there is data then store it in db
      }
    }
    return localDataSource.getMessageResponse(); // always return local data
  }
  
}