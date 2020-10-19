class NetworkException implements Exception {
  final _message;
  final _prefix;

  NetworkException(this._message, this._prefix);

  String toString(){
    return "$_prefix$_message";
  }

}

class NoInternetException extends NetworkException{
  NoInternetException(String message) : super(message, "No Internet");
}

class FetchDataException extends NetworkException{
  FetchDataException(String message) : super(message, "Error During Communication: ");
}

class BadRequestException extends NetworkException{
  BadRequestException(String message) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends NetworkException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends NetworkException {
  InvalidInputException([String message]) : super(message, "Invalid Input: ");
}