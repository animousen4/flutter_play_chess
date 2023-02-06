import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_play_chess/view/widget/clock/clock_widget.dart';

class UserGameBadge extends StatelessWidget {
  const UserGameBadge(
      {super.key,
      required this.name,
      required this.rating,
      required this.avatar,
      required this.clock,
      required this.countryFlag});

  final int rating;
  final Widget countryFlag;
  final Widget name;
  final Widget clock;
  final ImageProvider<Object> avatar;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: avatar,
        radius: 25,
      ),
      trailing: clock,
      title: DefaultTextStyle(
        child: name,
        style: Theme.of(context).textTheme.displaySmall!,
      ),
      subtitle: Row(
        children: [
          SizedBox(
            child: countryFlag,
            height: 11,
            width: 25,
          ),
          SizedBox(
            width: 10,
          ),
          Text(rating.toString())
        ],
      ),
    );
  }
}
