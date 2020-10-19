import 'package:flutter/cupertino.dart';
import 'package:hello_world/core/failure/exceptions/network_exception.dart';
import 'package:hello_world/core/network/network_info.dart';
import 'package:hello_world/data/datasources/remote_datasource/remote_datasource.dart';
import 'package:hello_world/data/models/message_response.dart';
import 'package:hello_world/data/repositories/repository.dart';

class RepositoryImpl extends Repository{

  final RemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  RepositoryImpl({@required this.remoteDataSource, @required this.networkInfo});


  @override
  Future<MessageResponse> getMessage() async{
    if(await networkInfo.isConnected){
      return remoteDataSource.getMessage();
    }else{
      //todo get data from local data source
      throw NoInternetException("");
    }
  }
  
}