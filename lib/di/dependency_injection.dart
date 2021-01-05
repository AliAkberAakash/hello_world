import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import '../core/network/api_base_helper.dart';
import '../core/network/dio_factory.dart';
import '../core/network/network_info.dart';
import '../data/datasources/local_datasource/local_datasource.dart';
import '../data/datasources/local_datasource/local_datasource_impl.dart';
import '../data/datasources/remote_datasource/remote_datasource.dart';
import '../data/datasources/remote_datasource/remote_datasource_impl.dart';
import '../data/datasources/remote_datasource/rest_service.dart';
import '../data/repositories/repository.dart';
import '../data/repositories/repository_impl.dart';

final locator  = GetIt.instance;

void setup() {

  locator.registerSingleton(DioFactory());
  locator.registerSingleton(ApiBaseHelper(dioFactory: locator()));
  locator.registerSingleton(RestService(helper: locator()));
  locator.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(service: locator()));
  locator.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());
  locator.registerFactory<NetworkInfo>(() => NetworkInfoImpl(DataConnectionChecker()));
  locator.registerLazySingleton<Repository>(() => RepositoryImpl(
      remoteDataSource: locator(),
      networkInfo: locator(),
      localDataSource: locator(),
    ),
  );
}