import 'package:chopper/chopper.dart';
import 'package:flutter_play_chess/logic/client/network_client.dart';
import 'package:flutter_play_chess/logic/model/request/sign_up/sign_up_request.dart';
import 'package:flutter_play_chess/logic/model/response/sign_up/sign_up_response.dart';

part 'sign_up_service.chopper.dart';

@ChopperApi(baseUrl: "/api/chess-mobile")
abstract class SignUpService extends ChopperService {

  
  @Post(path: "/registry")
  Future<Response<SignUpResponse>> registryDefault(
      @Body() SignUpRequest signUpRequest);

  

  static SignUpService create([NetworkClient? client]) => _$SignUpService(client);
}
