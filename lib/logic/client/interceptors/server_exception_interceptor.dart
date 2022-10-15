import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:flutter_play_chess/logic/exception/server_exception.dart';
import 'package:flutter_play_chess/logic/model/abstract_response.dart';
import 'package:flutter_play_chess/logic/model/code/server_code.dart';

class ServerExceptionInterceptor implements ResponseInterceptor {
  @override
  FutureOr<Response> onResponse(Response response) {
    if (response.body == null) {
      return response;
    }
    
    var code = (response.body as AbstractResponse).code;
    if (code != ServerCode.OC_OK) {
      throw ServerException.resolveException(code);
    }
    return response;
  }
}
