// ignore_for_file: prefer_const_constructors

import 'package:easy_localization/easy_localization.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_play_chess/logic/bloc/play_menu/bloc/play_menu_bloc.dart';
import 'package:flutter_play_chess/logic/bloc/user_info/user_info_bloc.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_category/category_variant.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_category/game_category_setting.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_color/game_color_setting.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_opponent/game_opponent_setting.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_opponent/opponent_variant.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_rating/game_rating_setting.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_setting/game_setting.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_type/time_type.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_type/type_game_setting.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_type/type_variant.dart';
import 'package:flutter_play_chess/view/routes/routes.dart';
import 'package:flutter_play_chess/view/theme/expandable_card_theme_data.dart';
import 'package:flutter_play_chess/view/theme/outlined_button_theme_secondary.dart';
import 'package:flutter_play_chess/view/theme/selection_item_theme.dart';
import 'package:flutter_play_chess/view/theme/simple_expandable_card_theme.dart';
import 'package:flutter_play_chess/view/widget/dropdown_physical_button/dropdown_physical_button.dart';
import 'package:flutter_play_chess/view/widget/expandable_card/expandable_card.dart';
import 'package:flutter_play_chess/view/widget/play_button/play_button.dart';
import 'package:flutter_play_chess/view/widget/selection_list/selection_item.dart';
import 'package:flutter_play_chess/view/widget/selection_list/selection_list.dart';
import 'package:flutter_play_chess/view/widget/sliver/play_sliver_delegate.dart';
import 'package:auto_route/auto_route.dart';
import 'package:lottie/lottie.dart';

@RoutePage()
class PlayPage extends StatefulWidget {
  const PlayPage({Key? key}) : super(key: key);

  @override
  State<PlayPage> createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
  // https://api.flutter.dev/flutter/widgets/NestedScrollView-class.html

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ExtendedNestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverPersistentHeader(
          delegate: PlaySliverDelegate(expandedHeight: 270),
          pinned: true,
        )
      ],
      body: BlocBuilder<PlayMenuBloc, PlayMenuState>(
        builder: (context, state) {
          return resolveWidget(state,
              onLoading: (state) => Center(
                    child: CircularProgressIndicator(),
                  ),
              onNormal: (state) => ListView(children: buildSettings(state)),
              onError: (state) => Center(
                    child: Text("Error occured"),
                  ));
        },
      ),
    );
  }

  List<Widget> buildSettings(PlayMenuNormal state) {
    return [
      menuListTile(
        tileName: Text("Rated Game"),
        child: Text("FFf")
      )
    ];
  }

  Widget menuListTile({Widget? tileName, Widget? child}) {
    return ListTile(
      title: tileName,
      subtitle: child,
    );
  }

  Widget resolveWidget(PlayMenuState state,
      {required Widget Function(PlayMenuLoading state) onLoading,
      required Widget Function(PlayMenuNormal state) onNormal,
      required Widget Function(dynamic state) onError}) {
    switch (state.runtimeType) {
      case PlayMenuLoading:
        return onLoading(state as PlayMenuLoading);
      case PlayMenuNormal:
        return onNormal(state as PlayMenuNormal);
      default:
        throw Exception("Not found a suitable builder for state '$state'");
    }
  }

  @override
  void initState() {
    context.read<PlayMenuBloc>().add(StartLoadData());
    context
        .read<UserInfoBloc>()
        .add(GetUsername(id: 0)); // get from UserService
    super.initState();
  }
}
