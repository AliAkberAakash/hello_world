import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:hello_world/core/network/api_base_helper.dart';
import 'package:hello_world/core/network/dio_factory.dart';
import 'package:hello_world/core/network/network_info.dart';
import 'package:hello_world/data/datasources/remote_datasource/remote_datasource.dart';
import 'package:hello_world/data/datasources/remote_datasource/remote_datasource_impl.dart';
import 'package:hello_world/data/datasources/remote_datasource/rest_service.dart';
import 'package:hello_world/data/repositories/repository.dart';
import 'package:hello_world/data/repositories/repository_impl.dart';

final locator  = GetIt.instance;

void setup() {

  locator.registerSingleton(DioFactory());
  locator.registerSingleton(ApiBaseHelper(dioFactory: locator()));
  locator.registerSingleton(RestService(helper: locator()));
  locator.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(service: locator()));
  locator.registerFactory<NetworkInfo>(() => NetworkInfoImpl(DataConnectionChecker()));
  locator.registerLazySingleton<Repository>(() => RepositoryImpl(remoteDataSource: locator(), networkInfo: locator()));
}