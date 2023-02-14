import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_play_chess/logic/bloc/user/user_bloc.dart';
import 'package:flutter_play_chess/view/widget/dropdown_physical_button/dropdown_physical_button.dart';

class AppStatePage extends StatefulWidget {
  const AppStatePage({Key? key, required this.context}) : super(key: key);

  final BuildContext context;
  @override
  State<AppStatePage> createState() => _AppStatePageState();
}

class _AppStatePageState extends State<AppStatePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            return ListTile(
                title: Text("debug.appState.currentAccount").tr(),
                subtitle: state.isReady
                    ? state.isAuthorized
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("status: authorized"),
                              Text("accessToken: '${state.accessToken}'"),
                              Text("jwtToken: '${state.jwtToken}'")
                            ],
                          )
                        : Text("status: not authorized")
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Prepairing data"),
                          SizedBox(
                            width: 10,
                          ),
                          SizedBox.square(
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                            dimension: 10,
                          )
                        ],
                      ));
          },
        ),
        ListTile(
          title: Text("Crashlytics Test"),
          subtitle: OutlinedButton(
            child: Text("Test exception"),
            onPressed: () {
              throw Exception("Test exception");
            },
          ),
        ),
        ListTile(
          title: const Text(
            "debug.appState.language",
          ).tr(),
          subtitle: DropdownPhysicalButton<Locale>(
              options: {
                Locale("ru"): Text("Русский"),
                Locale("en"): Text("English")
              },
              selected: widget.context.locale,
              callback: (locale) async {
                await context.setLocale(locale);
                await context.popRoute();
              }),
        )
        // ListTile(
        //   title: Text("Analytics events"),
        //   subtitle: Column(

        //     children: [
        //       OutlinedButton(
        //           onPressed: () {
        //             FirebaseAnalytics.instance.logEvent(name: "sign_up");
        //           },
        //           child: Text("Send sign_up event")),
        //       OutlinedButton(
        //           onPressed: () => FirebaseAnalytics.instance
        //               .logEvent(name: "test_purchase", parameters: {
        //                 "item_id" : 111111
        //               }),
        //           child: Text("Test purchase"))
        //     ],
        //   ),
        // )
      ],
    );
  }
}
