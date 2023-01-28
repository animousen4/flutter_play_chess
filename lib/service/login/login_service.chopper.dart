// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$LogInService extends LogInService {
  _$LogInService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = LogInService;

  @override
  Future<Response<LogInResponse>> loginDefault(LogInRequest logInRequest) {
    final Uri $url = Uri.parse('/api/chess-mobile/login');
    final $body = logInRequest;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<LogInResponse, LogInResponse>($request);
  }
}
