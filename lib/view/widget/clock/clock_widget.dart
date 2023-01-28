
import 'package:flutter/material.dart';
import 'package:flutter_play_chess/view/theme/clock_widget_theme.dart';

class ClockWidget extends StatelessWidget {
  const ClockWidget({super.key, required this.enabled});
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ClockWidgetTheme>()!;
    return AnimatedContainer(
        duration: theme.duration,
        decoration: enabled ? theme.decorationEnabled : theme.decoration,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 18),
          child: Text(
            "10:55",
            style: enabled ? theme.timeStyleEnabled : theme.timeStyle,
          ),
        ),
      );
  }
}