import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_play_chess/logic/bloc/play_menu/bloc/play_menu_bloc.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_category/game_category_setting.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_color/game_color_setting.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_opponent/game_opponent_setting.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_opponent/opponent_variant.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_rating/game_rating_setting.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_setting/game_setting.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_type/time_type.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_type/type_game_setting.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_type/type_variant.dart';
import 'package:flutter_play_chess/view/theme/expandable_card_theme_data.dart';
import 'package:flutter_play_chess/view/theme/selection_item_theme.dart';
import 'package:flutter_play_chess/view/theme/simple_expandable_card_theme.dart';
import 'package:flutter_play_chess/view/widget/dropdown_physical_button/dropdown_physical_button.dart';
import 'package:flutter_play_chess/view/widget/expandable_card/expandable_card.dart';
import 'package:flutter_play_chess/view/widget/selection_list/selection_item.dart';
import 'package:flutter_play_chess/view/widget/selection_list/selection_list.dart';

extension GameSetttingWidgetExtension on GameSetting {
  Widget toWidget(BuildContext context) {
    if (this is CategoryGameSetting) {
      return DropdownPhysicalButton<int>.builder(
          builder: (context, index) => Text(variants[index].name).tr(),
          itemCount: variants.length,
          selectedIndex: selectedVariantIndexes.first,
          callback: (index) => context.read<PlayMenuBloc>().add(
              GameSettingModified(copyWith(selectedVariantIndexes: [index]))));
    }

    if (this is RatingGameSetting) {
      return SelectionItemList<int>.builder(
        builder: (index, isSelected) => SelectionItem<int>(
            index: index,
            data: SelectionItemData<int>(
                selected: isSelected,
                callback: (index) => context.read<PlayMenuBloc>().add(
                    GameSettingModified(
                        copyWith(selectedVariantIndexes: [index])))),
            child: Text(variants[index].status).tr()),
        selectedItems: [selectedVariantIndexes.first],
        itemCount: variants.length,
      );
    }

    if (this is ColorGameSetting) {
      return SelectionItemList<int>.builder(
        builder: (index, isSelected) => SelectionItem<int>(
            index: index,
            data: SelectionItemData<int>(
                selected: isSelected,
                callback: (index) => context.read<PlayMenuBloc>().add(
                    GameSettingModified(
                        copyWith(selectedVariantIndexes: [index])))),
            child: Text(variants[index].colorName).tr()),
        selectedItems: [selectedVariantIndexes.first],
        itemCount: variants.length,
      );
    }

    if (this is OpponentGameSetting) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: (BuildContext context) {
          final List<Widget> variantsWidget = [];

          for (int i = 0; i < variants.length; i++) {
            // build 1 variant

            variantsWidget.add(((int index) => ExpandableCard(
                expandableCardThemeData: Theme.of(context)
                    .extension<SimpleExpandableCardTheme>()!
                    .expandableCardThemeData,
                onTap: () {
                  context.read<PlayMenuBloc>().add(GameSettingModified(
                      copyWith(selectedVariantIndexes: [index])));
                },
                header: Text(variants[index].opponentName).tr(),
                expandedContent: (int index) {
                  final variant = variants[index];
                  if (variant is ComputerOpponent) {
                    return Text("Choose option");
                  }
                }.call(index),
                isSelected: selectedVariantIndexes.contains(index))).call(i));
            variantsWidget.add(SizedBox(
              height: 15,
            ));
          }
          return variantsWidget;
        }.call(context),
      );
    }

    if (this is TypeGameSetting) {
      return Wrap(
        direction: Axis.horizontal,
        spacing: 15,
        runSpacing: 15,
        children: () {
          final List<Widget> types = [];

          // parts of sector
          int partIndex = 0;
          for (TypeVariant typeVariant in variants) {
            types.add(((BuildContext context, partIndex) => ExpandableCard(
                onTap: () => context.read<PlayMenuBloc>().add(
                    GameSettingModified(
                        copyWith(selectedVariantIndexes: [partIndex]))),
                header: Text(typeVariant.name).tr(),
                expandedContent: typeVariant is TimeType
                    ? Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 25),
                        child: ListTile(
                          title: Text(
                            "gameSetting.type.timePerSide",
                            style: Theme.of(context)
                                .extension<ExpandableCardThemeData>()!
                                .contentTextStyle!
                                .resolve({}),
                          ).tr(),
                          contentPadding: EdgeInsets.zero,
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: SelectionItemList<int>.builder(
                              builder: (index, isSelected) => SelectionItem(
                                  theme: Theme.of(context)
                                      .extension<SelectionItemThemeSecondary>()!
                                      .themeData,
                                  data: SelectionItemData<int>(
                                      selected:
                                          typeVariant.selectedIndex == index,
                                      callback: (index) => context
                                          .read<PlayMenuBloc>()
                                          .add(GameSettingModified(modifyGameSetting(
                                              partIndex,
                                              typeVariant.modifySelectedIndex(
                                                  index))))),
                                  child: Text(typeVariant.timePerSideVariants[index].inMinutes
                                      .toString()),
                                  index: index),
                              itemCount: typeVariant.timePerSideVariants.length,
                            ),
                          ),
                        ),
                      )
                    : null,
                isSelected: selectedVariantIndexes
                    .contains(partIndex))).call(context, partIndex));
            partIndex++;
          }
          return types;
        }.call(),
      );
    }

    return Text("UNKNOWN");
  }
}

class GameSettingWidget extends StatelessWidget {
  const GameSettingWidget({super.key, required this.gameSetting});
  final GameSetting gameSetting;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Text(gameSetting.settingName).tr(),
      ),
      subtitle: gameSetting.toWidget(context),
    );
  }
}
