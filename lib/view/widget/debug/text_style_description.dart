import 'package:flutter/material.dart';


class TextStyleDescription extends StatelessWidget {
  const TextStyleDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("displayLarge", style: Theme.of(context).textTheme.displayLarge,),
        Text("displayMedium", style: Theme.of(context).textTheme.displayMedium,),
        Text("displaySmall", style: Theme.of(context).textTheme.displaySmall,),
        Text.rich(TextSpan(
          text: "headlineMedium"
        ),style: Theme.of(context).textTheme.headlineMedium!.copyWith(decoration: TextDecoration.lineThrough)),
        Text.rich(TextSpan(
          text: "headlineSmall"
        ),style: Theme.of(context).textTheme.headlineSmall!.copyWith(decoration: TextDecoration.lineThrough)),
      ]
    );
  }
}
