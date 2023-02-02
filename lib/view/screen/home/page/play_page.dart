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
import 'package:flutter_play_chess/logic/model/lobby/game_rating/game_rating_setting.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_setting/game_setting.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_type/time_type.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_type/type_game_setting.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_type/type_variant.dart';
import 'package:flutter_play_chess/view/routes/routes.dart';
import 'package:flutter_play_chess/view/theme/expandable_card_theme_data.dart';
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
      settingWidgets.add(((gameSettingIndex) => ListTile(
            title: Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Text(g.settingName).tr(),
            ),
            subtitle: ((BuildContext context) {
              if (g is TypeGameSetting) {
                return Wrap(
                  direction: Axis.horizontal,
                  spacing: 15,
                  runSpacing: 15,
                  children: () {
                    final List<Widget> types = [];

                    // parts of sector
                    int partIndex = 0;
                    for (TypeVariant typeVariant in g.variants) {
                      types.add(((BuildContext context, partIndex) =>
                          ExpandableCard(
                              onTap: () => context.read<PlayMenuBloc>().add(
                                  GameSettingModified(g.copyWith(
                                      selectedVariantIndexes: [partIndex]))),
                              header: Text(typeVariant.name).tr(),
                              expandedContent: typeVariant is TimeType
                                  ? Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, bottom: 25),
                                      child: ListTile(
                                        title: Text(
                                          "gameSetting.type.timePerSide",
                                          style: Theme.of(context)
                                              .extension<
                                                  ExpandableCardThemeData>()!
                                              .contentTextStyle!
                                              .resolve({}),
                                        ).tr(),
                                        contentPadding: EdgeInsets.zero,
                                        subtitle: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: SelectionItemList<int>.builder(
                                            builder: (index, isSelected) => SelectionItem(
                                                theme: Theme.of(context)
                                                    .extension<
                                                        SelectionItemThemeSecondary>()!
                                                    .themeData,
                                                data: SelectionItemData<int>(
                                                    selected:
                                                        typeVariant.selectedIndex ==
                                                            index,
                                                    callback: (index) => context
                                                        .read<PlayMenuBloc>()
                                                        .add(GameSettingModified(
                                                            g.modifyGameSetting(
                                                                partIndex,
                                                                typeVariant
                                                                    .modifySelectedIndex(index))))),
                                                child: Text(typeVariant.timePerSideVariants[index].inMinutes.toString()),
                                                index: index),
                                            itemCount: typeVariant
                                                .timePerSideVariants.length,
                                          ),
                                        ),
                                      ),
                                    )
                                  : null,
                              isSelected: g.selectedVariantIndexes.contains(
                                  partIndex))).call(context, partIndex));
                      partIndex++;
                    }
                    return types;
                  }.call(),
                );
              }

              if (g is CategoryGameSetting) {
                return DropdownPhysicalButton<int>.builder(
                    builder: (context, index) =>
                        Text(g.variants[index].name).tr(),
                    itemCount: g.variants.length,
                    selectedIndex: g.selectedVariantIndexes.first,
                    callback: (index) => context.read<PlayMenuBloc>().add(
                        GameSettingModified(
                            g.copyWith(selectedVariantIndexes: [index]))));
              }

              if (g is RatingGameSetting) {
                return SelectionItemList<int>.builder(
                  builder: (index, isSelected) => SelectionItem<int>(
                      index: index,
                      data: SelectionItemData<int>(
                          selected: isSelected,
                          callback: (index) => context.read<PlayMenuBloc>().add(
                              GameSettingModified(g
                                  .copyWith(selectedVariantIndexes: [index])))),
                      child: Text(g.variants[index].status).tr()),
                  selectedItems: [g.selectedVariantIndexes.first],
                  itemCount: g.variants.length,
                );
              }

              if (g is ColorGameSetting) {
                return SelectionItemList<int>.builder(
                  builder: (index, isSelected) => SelectionItem<int>(
                      index: index,
                      data: SelectionItemData<int>(
                          selected: isSelected,
                          callback: (index) => context.read<PlayMenuBloc>().add(
                              GameSettingModified(g
                                  .copyWith(selectedVariantIndexes: [index])))),
                      child: Text(g.variants[index].colorName).tr()),
                  selectedItems: [g.selectedVariantIndexes.first],
                  itemCount: g.variants.length,
                );
              }
            }).call(context),
          )).call(gameSettingIndex));

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