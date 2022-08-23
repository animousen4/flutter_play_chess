import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_play_chess/logic/bloc/play_menu/bloc/play_menu_bloc.dart';
import 'package:flutter_play_chess/logic/bloc/user_info/user_info_bloc.dart';
import 'package:flutter_play_chess/view/widget/dropdown_physical_button/dropdown_physical_button.dart';
import 'package:flutter_play_chess/view/widget/selection_list/selection_list.dart';
import 'package:flutter_play_chess/view/widget/sliver/play_sliver_delegate.dart';

class PlayPage extends StatefulWidget {
  const PlayPage({Key? key}) : super(key: key);

  @override
  State<PlayPage> createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
  // https://api.flutter.dev/flutter/widgets/NestedScrollView-class.html
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
                        child: Text("Rated game GG"),
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
                    ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Text("Category"),
                      ),
                      subtitle: DropdownPhysicalButton(
                        selectedIndex: state.selectedCategoryIndex,
                        callback: (index) => context.read<PlayMenuBloc>().add(CategoryGameChanged(index)),
                        options: [
                          Text("1"),
                          Text("2"),
                          Text("3"),
                        ],
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
    context.read<UserInfoBloc>().add(GetUsername(id: 0)); // get from UserService
    super.initState();
  }
}
// extended_nested_scroll_view: 