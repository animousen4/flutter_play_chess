import 'package:chopper/chopper.dart';
import 'package:flutter_play_chess/logic/client/network_client_secured.dart';
import 'package:flutter_play_chess/logic/model/entity/action/entity_action.dart';
import 'package:flutter_play_chess/logic/model/entity/info/created_login/created_login.dart';
import 'package:flutter_play_chess/logic/model/entity/info/login/entity_login.dart';
import 'package:flutter_play_chess/logic/model/request/log_in_request.dart';
import 'package:flutter_play_chess/logic/model/response/log_in_response.dart';
import 'package:flutter_play_chess/service/user/user.dart';
import 'package:logger/logger.dart';

part 'login_service.chopper.dart';

@ChopperApi(baseUrl: "/api/chess-mobile")
abstract class LogInService extends ChopperService {
  LogInService();

  @Post(path: "/login")
  Future<Response<LogInResponse>> loginDefault(
      @Body() LogInRequest logInRequest);

  

  static LogInService create([NetworkClientSecured? client]) => _$LogInService(client);
}
