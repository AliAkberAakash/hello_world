
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hello_world/core/network/api_base_helper.dart';
import 'package:hello_world/core/network/dio_factory.dart';
import 'package:hello_world/data/datasources/remote_datasource/remote_datasource.dart';
import 'package:hello_world/data/datasources/remote_datasource/remote_datasource_impl.dart';
import 'package:hello_world/data/datasources/remote_datasource/rest_service.dart';
import 'package:hello_world/data/models/message_response.dart';
import 'package:mockito/mockito.dart';

/*class MockRestService extends Mock implements RestService{}*/

void main() {

  DioFactory dioFactory;
  ApiBaseHelper helper;
  RestService service;
  RemoteDataSource remoteDataSource;

  setUp(() {
    dioFactory = DioFactory();
    helper = ApiBaseHelper(dioFactory : dioFactory);
    service = RestService(helper: helper);
    remoteDataSource = RemoteDataSourceImpl(service: service);
  });

  group('getMessage', () {

    final tMessage = MessageResponse(
      success: true,
      message: "Hello world"
    );

    test('getMessage with success response', () async {
      //arrange
     /* when(service.getMessage()).thenAnswer((realInvocation) async {
        return Response(data: tMessage.toJson(), statusCode: 200);
      });*/
      //act
      final result = await remoteDataSource.getMessage();

      print(result.toJson());
      //assert
      expect(result, equals(tMessage));
    });

  });

}