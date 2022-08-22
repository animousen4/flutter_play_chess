
import 'package:flutter_play_chess/logic/model/entity/action/entity_action.dart';
import 'package:flutter_play_chess/logic/model/entity/info/entity_info.dart';


abstract class AbstractRequest {

  String get version;
  EntityAction get entityAction;
  EntityInfo get entityInfo;
  
}