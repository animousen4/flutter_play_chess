import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class UserGameBadge extends StatelessWidget {
  const UserGameBadge(
      {super.key,
      required this.name,
      required this.rating,
      required this.avatar,
      required this.countryFlag});

  final int rating;
  final Widget countryFlag;
  final Widget name;
  final ImageProvider<Object> avatar;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: avatar,
        radius: 25,
      ),
      trailing: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(55, 65, 88, 1),
          borderRadius: BorderRadius.circular(7),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 18),
          child: Text(
            "10:55",
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
      ),
      title: DefaultTextStyle(
        child: name,
        style: Theme.of(context).textTheme.headline3!,
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
