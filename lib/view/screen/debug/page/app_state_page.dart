import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_play_chess/logic/bloc/user/user_bloc.dart';

class AppStatePage extends StatelessWidget {
  const AppStatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            return ListTile(
                title: Text("Current account"),
                subtitle: state.user != null
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("status: authorized"),
                          Text("accessToken: '${state.user?.accessToken}'"),
                          Text("jwtToken: '${state.user?.jwtToken}'")
                        ],
                      )
                    : Text("status: not authorized"));
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
          title: Text("Analytics events"),
          subtitle: OutlinedButton(
              onPressed: () {
                FirebaseAnalytics.instance.logEvent(name: "sign_up");
              },
              child: Text("Send sign_up event")),
        )
      ],
    );
  }
}
