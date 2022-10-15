import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_play_chess/view/widget/bullet_dot/bullet_dot.dart';

class ShortStatElement extends StatelessWidget {
  const ShortStatElement({
    this.leading = const BulletDot(),
    this.spacing = 10,
    required this.name,
    required this.value,
    Key? key,
  }) : super(key: key);
  final Widget leading;
  final Widget value;
  final Widget name;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        leading,
        SizedBox(
          width: spacing,
        ),
        value,
        SizedBox(
          width: spacing,
        ),
        DefaultTextStyle(child: name, style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.grey),)
      ],
    );
  }
}
