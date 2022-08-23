import 'package:chopper/chopper.dart';
import 'package:flutter_play_chess/logic/model/abstract_request.dart';
import 'package:flutter_play_chess/logic/model/abstract_response.dart';

class NetworkingHelper {
  final Future<Response<AbstractResponse>> Function() request;

  final Function(Response<AbstractResponse> response) onSuccess;
  final Function(Exception error) onError;

  NetworkingHelper(
      {required this.request, required this.onSuccess, required this.onError});

  //https://betterprogramming.pub/functional-error-handling-in-flutter-ac6fcf8ae22b
  void makeRequest() async {
    try {
      final response = await request();
      checkCode(response.statusCode);
      if (response.body != null) {
        
      }
    } on Exception catch (e) {
      onError(e);
    }
  }

  void checkCode(int code) {}
}
