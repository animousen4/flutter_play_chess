// ignore_for_file: prefer_const_constructors

import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_play_chess/logic/bloc/play_menu/bloc/play_menu_bloc.dart';
import 'package:flutter_play_chess/logic/bloc/user_info/user_info_bloc.dart';
import 'package:flutter_play_chess/view/routes/routes.dart';
import 'package:flutter_play_chess/view/theme/selection_item_theme.dart';
import 'package:flutter_play_chess/view/widget/dropdown_physical_button/dropdown_physical_button.dart';
import 'package:flutter_play_chess/view/widget/expandable_card/expandable_card.dart';
import 'package:flutter_play_chess/view/widget/play_button/play_button.dart';
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
                      subtitle: SelectionItemList.radio(
                        callback: (index) => context
                            .read<PlayMenuBloc>()
                            .add(RatedGameChanged(index)),
                        items: [
                          Text("On"),
                          Text("Off"),
                        ],
                        selectedIndex: state.selectedRatedIndex,
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
                              isPressed: selectedIndex == 0,
                              header: Text("Classic"),
                              description: null,
                              expandedContent: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  title: Text("Minutes per side"), // need to be black
                                  subtitle: SelectionItemList.radio(
                                    items: [Text("10"), Text("20"), Text("30")],
                                    callback: (index) => null,
                                    selectedIndex: 0,
                                    theme: Theme.of(context)
                                        .extension<SelectionItemThemeSecondary>()!
                                        .themeData,
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
                              isPressed: selectedIndex == 1,
                              header: Text("Blitz"),
                              description: null,
                              expandedContent: Text("content"),
                              isSelected: selectedIndex == 1),
                          ExpandableCard(
                              onTap: () {
                                setState(() {
                                  selectedIndex = 2;
                                });
                              },
                              isPressed: selectedIndex == 2,
                              header: Text("Bullet"),
                              description: null,
                              expandedContent: Text("content"),
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
                      subtitle: DropdownPhysicalButton(
                        selectedIndex: state.selectedCategoryIndex,
                        callback: (index) => context
                            .read<PlayMenuBloc>()
                            .add(CategoryGameChanged(index)),
                        options: [
                          Text("Regular"),
                          Text("Other"),
                        ],
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
                      subtitle: SelectionItemList.radio(
                          items: [Text("W"), Text("B"), Text("R")],
                          callback: (index) => context
                              .read<PlayMenuBloc>()
                              .add(ColorGameChanged(index)),
                          selectedIndex: state.selectedColorIndex),
                    ),
                    ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Text("Opponent"),
                      ),
                      subtitle: ElevatedButton(
                        onPressed: () {},
                        child: SizedBox(
                            height: 50,
                            child: Align(
                              child: Text("Online"),
                              alignment: Alignment.centerLeft,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 15,
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