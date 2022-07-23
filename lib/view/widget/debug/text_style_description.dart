import 'package:flutter/material.dart';


class TextStyleDescription extends StatelessWidget {
  const TextStyleDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("headline1", style: Theme.of(context).textTheme.headline1,),
        Text("headline2", style: Theme.of(context).textTheme.headline2,),
        Text("headline3", style: Theme.of(context).textTheme.headline3,),
        Text.rich(TextSpan(
          text: "headline4"
        ),style: Theme.of(context).textTheme.headline4!.copyWith(decoration: TextDecoration.lineThrough)),
        Text.rich(TextSpan(
          text: "headline5"
        ),style: Theme.of(context).textTheme.headline5!.copyWith(decoration: TextDecoration.lineThrough)),
        Text.rich(TextSpan(
          text: "headline6"
        ),style: Theme.of(context).textTheme.headline6!.copyWith(decoration: TextDecoration.lineThrough)),
      ]
    );
  }
}
