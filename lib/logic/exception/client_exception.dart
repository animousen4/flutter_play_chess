import 'package:flutter_play_chess/logic/exception/app_exception.dart';

abstract class ClientExcpetion extends AppException {}

class UnknownClientException extends ClientExcpetion {}
