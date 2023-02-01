// ignore_for_file: prefer_const_constructors

import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_play_chess/logic/bloc/play_menu/bloc/play_menu_bloc.dart';
import 'package:flutter_play_chess/logic/bloc/user_info/user_info_bloc.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_category/game_category_setting.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_color/game_color_setting.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_setting/game_setting.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_setting/game_type/time_type.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_setting/game_type/type_game_setting.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_setting/game_type/type_variant.dart';
import 'package:flutter_play_chess/view/routes/routes.dart';
import 'package:flutter_play_chess/view/theme/selection_item_theme.dart';
import 'package:flutter_play_chess/view/theme/simple_expandable_card_theme.dart';
import 'package:flutter_play_chess/view/widget/dropdown_physical_button/dropdown_physical_button.dart';
import 'package:flutter_play_chess/view/widget/expandable_card/expandable_card.dart';
import 'package:flutter_play_chess/view/widget/play_button/play_button.dart';
import 'package:flutter_play_chess/view/widget/selection_list/selection_item.dart';
import 'package:flutter_play_chess/view/widget/selection_list/selection_list.dart';
import 'package:flutter_play_chess/view/widget/sliver/play_sliver_delegate.dart';
import 'package:auto_route/auto_route.dart';

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
              onNormal: (state) =>
                  ListView(children: buildSettings(state.gameSettings)),
              onError: (state) => Center(
                    child: Text("Error occured"),
                  ));
        },
      ),
    );
  }

  List<Widget> buildSettings(List<GameSetting> gameSettings) {
    final settingWidgets = <Widget>[];

    int gameSettingIndex = 0;
    for (GameSetting g in gameSettings) {
      if (g is TypeGameSetting) {
        // One Type - g - SECTOR
        settingWidgets.add(((gameSettingIndex) => ListTile(
          title: Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Text(g.settingName),
          ),
          subtitle: Wrap(
            direction: Axis.horizontal,
            spacing: 15,
            runSpacing: 15,
            children: () {
              final List<Widget> types = [];

              // parts of sector
              int partIndex = 0;
              for (TypeVariant typeVariant in g.variants) {
                if (typeVariant is TimeType) {
                  types.add(((BuildContext context, partIndex) => ExpandableCard(
                      onTap: () => context
                                      .read<PlayMenuBloc>()
                                      .add(
                                          GameSettingModified(g.copyWith(selectedVariantIndexes: [partIndex]))),
                      header: Text(typeVariant.name),
                      expandedContent: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: SelectionItemList<int>.builder(
                          builder: (index, isSelected) => SelectionItem(
                              theme: Theme.of(context)
                                  .extension<SelectionItemThemeSecondary>()!
                                  .themeData,
                              data: SelectionItemData<int>(
                                  selected: typeVariant.selectedIndex == index,
                                  callback: (index) => context
                                      .read<PlayMenuBloc>()
                                      .add(
                                          GameSettingModified(g.modifyGameSetting(partIndex, typeVariant.modifySelectedIndex(index))))),
                              child: Text(typeVariant
                                  .timePerSideVariants[index].inMinutes
                                  .toString()),
                              index: index),
                          itemCount: typeVariant.timePerSideVariants.length,
                        ),
                      ),
                      isSelected: g.selectedVariantIndexes.contains(partIndex))).call(context, partIndex));
                }
                partIndex++;
              }

              return types;
            }.call(),
          ),
        )).call(gameSettingIndex));
      }

      gameSettingIndex++;
    }

    return settingWidgets;
  }

  Widget resolveWidget(PlayMenuState state,
      {required Widget Function(PlayMenuLoading state) onLoading,
      required Widget Function(PlayMenuNormal state) onNormal,
      required Widget Function(PlayMenuError state) onError}) {
    switch (state.runtimeType) {
      case PlayMenuLoading:
        return onLoading(state as PlayMenuLoading);
      case PlayMenuNormal:
        return onNormal(state as PlayMenuNormal);
      case PlayMenuError:
        return onError(state as PlayMenuError);
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
// extended_nested_scroll_view: 