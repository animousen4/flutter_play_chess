import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_play_chess/view/theme/play_button_theme.dart';

class PlayButton extends StatelessWidget {
  final Widget child;
  final Function()? onPressed;
  const PlayButton({super.key, required this.child, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<PlayButtonTheme>()!;
    return Container(
      child: ElevatedButton(
          onPressed: onPressed,
          child: child,
          style: (theme.buttonStyle!.merge(Theme.of(context)
              .elevatedButtonTheme
              .style!))),
      decoration: theme.decoration,
    );
  }
}
