import 'package:flutter_play_chess/logic/error/app_error.dart';

abstract class AppClientError extends AppError {}

class AppUnknownClientError extends AppClientError {}

class AppSerializationError extends AppClientError {}

class AppConnectionError extends AppClientError {}
