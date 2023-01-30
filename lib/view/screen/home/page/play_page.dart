// ignore_for_file: prefer_const_constructors

import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_play_chess/logic/bloc/play_menu/bloc/play_menu_bloc.dart';
import 'package:flutter_play_chess/logic/bloc/user_info/user_info_bloc.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_category/game_category_setting.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_category/other_game_category_setting.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_category/regular_game_category_setting.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_color/game_color_setting.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_setting/game_type/time_type_game_setting.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_setting/game_type/type_game_setting.dart';
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
              onNormal: (state) => ListView(children: [
                    ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Text("Rated game"),
                      ),
                      subtitle: SelectionItemList<bool>.radio(
                        callback: (index) => context
                            .read<PlayMenuBloc>()
                            .add(RatedGameChanged(index)),
                        items: {
                          true: Text("On"),
                          false: Text("Off"),
                        },
                        selected: state.isRatedGame,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Text("Type"),
                      ),
                      subtitle: Wrap(
                        direction: Axis.horizontal,
                        spacing: 15,
                        runSpacing: 15,
                        children: [
                          ExpandableCard(
                              onTap: () {
                                setState(() {
                                  selectedIndex = 0;
                                });
                              },
                              closedFullHeight: true,
                              header: Text("Classic"),
                              expandedContent: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  title: Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Text(
                                      "Minutes per side",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ), // need to be black
                                  subtitle: SelectionItemList<Duration>.builder(
                                    isRadio: true,
                                    items: [
                                      Duration(minutes: 10),
                                      Duration(minutes: 20),
                                      Duration(minutes: 30)
                                    ],
                                    selectedItem: (state.typeGameSetting as TimeTypeGameSetting).timePerSide,
                                    builder: (item, selected) => SelectionItem<
                                            Duration>(
                                        data: SelectionItemData(
                                          selected: selected,
                                          callback: (d) { context
                                              .read<PlayMenuBloc>()
                                              .add(TypeGameChanged(
                                                  TimeTypeGameSetting(
                                                      name: "classic-01",
                                                      timePerSide: d))); print(d);},
                                        ),
                                        index: item,
                                        theme: Theme.of(context)
                                            .extension<
                                                SelectionItemThemeSecondary>()!
                                            .themeData,
                                        child: Text(item.inMinutes.toString())),
                                  ),
                                ),
                              ),
                              isSelected: selectedIndex == 0),
                          ExpandableCard(
                              onTap: () {
                                setState(() {
                                  selectedIndex = 1;
                                });
                              },
                              header: Text("Blitz"),
                              expandedContent: Text("content"),
                              isSelected: selectedIndex == 1),
                          ExpandableCard(
                              onTap: () {
                                setState(() {
                                  selectedIndex = 2;
                                });
                              },
                              header: Text("Bullet"),
                              expandedContent: null,
                              isSelected: selectedIndex == 2)
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Text("Category"),
                      ),
                      subtitle: DropdownPhysicalButton<CategoryGameSetting>(
                        selected: state.categoryGameSetting,
                        callback: (index) => context
                            .read<PlayMenuBloc>()
                            .add(CategoryGameChanged(index)),
                        options: {
                          RegularGameCategorySetting(): Text("Regular"),
                          OtherGameCategorySetting(): Text("Other"),
                        },
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Text("Color"),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 15),
                      subtitle: SelectionItemList<ColorGameSetting>.radio(
                          items: {
                            ColorGameSetting(color: "w"): Text("W"),
                            ColorGameSetting(color: "b"): Text("B"),
                            ColorGameSetting(color: "r"): Text("R")
                          },
                          callback: (index) => context
                              .read<PlayMenuBloc>()
                              .add(ColorGameChanged(index)),
                          selected: state.colorGameSetting),
                    ),
                    ListTile(
                        title: Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Text("Opponent"),
                        ),
                        subtitle: Column(
                          children: [
                            ExpandableCard(
                              onTap: () => null,
                              isSelected: true,
                              header: Text("Online"),
                              expandableCardThemeData: Theme.of(context)
                                  .extension<SimpleExpandableCardTheme>()!
                                  .expandableCardThemeData,
                              showStatusIcon: false,
                              expandedContent: null,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ExpandableCard(
                              onTap: () => null,
                              isSelected: false,
                              header: Text("With friend"),
                              expandableCardThemeData: Theme.of(context)
                                  .extension<SimpleExpandableCardTheme>()!
                                  .expandableCardThemeData,
                              showStatusIcon: false,
                              expandedContent: null,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ExpandableCard(
                              onTap: () => null,
                              isSelected: false,
                              header: Text("With computer"),
                              expandableCardThemeData: Theme.of(context)
                                  .extension<SimpleExpandableCardTheme>()!
                                  .expandableCardThemeData,
                              showStatusIcon: true,
                              expandedContent: Text("HI"),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      subtitle: PlayButton(
                        child: Text(
                          "Play",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          context.pushRoute(PlayGameScreenRoute());
                        },
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("1.213.332 players"),
                          Text("30.375 games")
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ]),
              onError: (state) => Center(
                    child: Text("Error occured"),
                  ));
        },
      ),
    );
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