abstract class ViewModelError {}

class ServerError extends ViewModelError {
  final String? serverMessage;

  ServerError({this.serverMessage});
}

class ClientError extends ViewModelError {}



class BadConnection extends ClientError {
  BadConnection();
}
