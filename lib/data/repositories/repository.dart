import 'package:hello_world/data/models/message_response.dart';

abstract class Repository {
  Future<MessageResponse> getMessage();
}