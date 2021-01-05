import '../models/message_response.dart';

abstract class Repository {
  Future<MessageResponse> getMessage();
}