import 'package:chopper/chopper.dart';
import 'package:flutter_play_chess/logic/client/chopper_client.dart';
import 'package:flutter_play_chess/service/user/user_service.dart';

part 'user_info_service.chopper.dart';

@ChopperApi(baseUrl: "/a-i0/user")
abstract class UserInfoService extends ChopperService {

  UserService get userService => (client as AppClient).userService;

  Future<String> getUsername() async => Future.delayed(Duration(milliseconds: 700), () => userService.jwtToken ?? "no username");

  static UserInfoService create([AppClient? client]) =>
      _$UserInfoService(client);
}
