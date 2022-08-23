import 'package:flutter_play_chess/logic/model/abstract_request.dart';
import 'package:flutter_play_chess/logic/model/abstract_response.dart';

class NetworkingHelper {
  final Function request;

  NetworkingHelper({required this.request});

  void makeRequest() async {
    //var response = request();
  }
}
