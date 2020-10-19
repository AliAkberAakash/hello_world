import 'package:hello_world/data/models/message_response.dart';

abstract class RemoteDataSource {
  /// Calls [BASE_URL]
  ///
  /// returns a [MessageResponse] on success
  Future<MessageResponse> getMessage();
}