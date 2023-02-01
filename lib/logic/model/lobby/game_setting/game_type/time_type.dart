import 'package:flutter_play_chess/logic/model/lobby/game_setting/game_type/type_game_setting.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_setting/game_type/type_variant.dart';

class TimeType extends TypeVariant {
  final List<Duration> timePerSideVariants;
  final int? selectedIndex;
  TimeType({
    required this.timePerSideVariants,
    required this.selectedIndex,
    required super.name,
  });

  TimeType modifySelectedIndex(int? newSelectedIndex) {
    return TimeType(timePerSideVariants: timePerSideVariants, selectedIndex: newSelectedIndex, name: name);
  }
}
