import 'package:flutter/cupertino.dart';
import '../../core/network/network_info.dart';
import '../datasources/local_datasource/local_datasource.dart';
import '../datasources/remote_datasource/remote_datasource.dart';
import '../models/message_response.dart';
import 'repository.dart';

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