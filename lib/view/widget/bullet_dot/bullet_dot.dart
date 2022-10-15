import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_play_chess/view/theme/app_theme.dart';

class BulletDot extends StatefulWidget {
  const BulletDot(
      {Key? key,
      this.dotRadius = 10,
      this.animate = false,
      this.backgroundColor = Colors.white,
      this.duration = const Duration(seconds: 1),
      this.colors,
      this.begin = Alignment.topLeft,
      this.end = Alignment.bottomRight})
      : super(key: key);
  final List<Color>? colors;
  final Duration duration;
  final Color backgroundColor;
  final double dotRadius;
  final Alignment begin;
  final Alignment end;
  final bool animate;
  @override
  State<BulletDot> createState() => _BulletDotState();
}

class _BulletDotState extends State<BulletDot>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  double xPos = 0;
  double yPos = 1;
  @override
  Widget build(BuildContext context) {
    return ClipOval(
        child: Container(
      //duration: Duration(milliseconds: 200),
      width: widget.dotRadius,
      height: widget.dotRadius,
      decoration: BoxDecoration(
          color: widget.backgroundColor,
          gradient: widget.colors == null ? null : widget.animate
              ? LinearGradient(
                  colors: widget.colors!,
                  begin: Alignment(xPos, yPos),
                  end: Alignment(-xPos, -yPos))
              : LinearGradient(
                  colors: widget.colors!,
                  begin: widget.begin,
                  end: widget.end)),
      constraints: BoxConstraints(),
    ));
  }

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: widget.duration);
    animationController.addListener(() {
      setState(() {
        xPos = 1 * cos(animationController.value * 2 * pi);
        yPos = 1 * sin(animationController.value * 2 * pi);
      });
    });

    if (widget.animate) animationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
