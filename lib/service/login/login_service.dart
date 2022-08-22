import 'package:chopper/chopper.dart';
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

  // Future<User> loginDefault(String username, String password) async {
  //   var resp = await dio.post("/api/chess-mobile/login",
  //       data: LogInRequest((r) => r
  //         ..version = "not defined"
  //         ..entityAction = EntityAction((act) => act..actionCode = ActionCode.CREATE_ENTITY).toBuilder()
  //         ..entityInfo = EntityLogin((data) => data
  //           ..accessToken = null
  //           ..userLogin = username
  //           ..userPass = password
  //           ..appPackage = null
  //           ..appVersion = null)));
  //   Logger().w("$resp");
  //   return User(accessToken: "2222222access", jwtToken: "3333333333jwtToken");
  // }
  @Post(path: "/login")
  Future<Response<LogInResponse>> loginDefault(
      @Body() LogInRequest logInRequest);

  static LogInService create([ChopperClient? client]) => _$LogInService(client);
}
