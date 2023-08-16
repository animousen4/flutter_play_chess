// ignore_for_file: prefer_const_constructors
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_play_chess/logic/bloc/play_menu/bloc/play_menu_bloc.dart';
import 'package:flutter_play_chess/logic/bloc/user_info/user_info_bloc.dart';
import 'package:flutter_play_chess/logic/model/lobby/game_setting/game_setting.dart';
import 'package:flutter_play_chess/view/routes/routes.dart';
import 'package:flutter_play_chess/view/theme/outlined_button_theme_secondary.dart';
import 'package:flutter_play_chess/view/widget/game_settings/game_setting_widget.dart';
import 'package:flutter_play_chess/view/widget/play_button/play_button.dart';
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
      body: BlocConsumer<PlayMenuBloc, PlayMenuState>(
        listener: (context, state) async {
          if (state is PlayMenuNormal) {
            if (state.isSearching) {
              showDialog(
                  context: context,
                  builder: (c) => AlertDialog(
                        title: Text("Searching for opponents"),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                                "It may take up to 5 min to find the right opponent..."),
                            SizedBox(
                              child:
                                  Lottie.asset("assets/animation/loading.json"),
                              height: 50,
                            ),
                            OutlinedButton(
                              onPressed: () {
                                context
                                    .read<PlayMenuBloc>()
                                    .add(SearchCancelRequest());
                              },
                              child: Text("Cancel"),
                              style: Theme.of(context)
                                  .extension<OutlinedButtonThemeSecondary>()!
                                  .themeData!
                                  .style,
                            )
                          ],
                        ),
                      ),
                  barrierDismissible: false);
            } else {
              context.popRoute();
              if (state.gameFound) {
                context.pushRoute(PlayGameRoute());
                context.read<PlayMenuBloc>().add(GameReceived());
              }
            }
          }
        },
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

    // build settings sectors
    for (GameSetting g in gameSettings) {
      settingWidgets.add(GameSettingWidget(gameSetting: g));
    }

    settingWidgets.add(BlocBuilder<PlayMenuBloc, PlayMenuState>(
      builder: (context, state) {
        return ListTile(
            title: PlayButton(
                child: Text("Play"),
                onPressed: (state as PlayMenuNormal).playAllowed
                    ? () {
                        //context.pushRoute(PlayGameScreenRoute());
                        context.read<PlayMenuBloc>().add(PlayRequest());
                      }
                    : null));
      },
    ));
    settingWidgets.add(SizedBox(
      height: 15,
    ));

    return settingWidgets;
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
// extended_nested_scroll_view: 