import '../../models/message_response.dart';

abstract class LocalDataSource {
  /// Returns the last saved [MessageResponse] from
  /// local database
  Future<MessageResponse> getMessageResponse();

  /// Stores a [MessageResponse] to the
  /// local database
  void setMessageResponse(MessageResponse response);
}