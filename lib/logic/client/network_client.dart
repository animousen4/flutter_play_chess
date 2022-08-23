import 'package:chopper/chopper.dart';
import 'package:flutter_play_chess/globals.dart';
import 'package:flutter_play_chess/logic/client/converter/converter.dart';
import 'package:flutter_play_chess/logic/client/interceptors/log_interceptor.dart';
import 'package:flutter_play_chess/service/login/login_service.dart';

class NetworkClient extends ChopperClient {
  NetworkClient() : super(
    baseUrl: Globals.url,
    converter: DataConverter(),
    interceptors: [LogInterceptor()],
    services: [LogInService.create()]
  );
}
