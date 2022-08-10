import 'package:dio/dio.dart';
import 'package:flutter_play_chess/globals.dart';

class DioService {
  late final _instanse;

  DioService() {
    _instanse = Dio(
      BaseOptions(
        baseUrl: Globals.url
      ) 
    );
  }
}
