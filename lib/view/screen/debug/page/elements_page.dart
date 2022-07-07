import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_play_chess/view/widget/selection_list/selection_list.dart';

class ElementsPage extends StatefulWidget {
  const ElementsPage({Key? key}) : super(key: key);

  @override
  State<ElementsPage> createState() => _ElementsPageState();
}

class _ElementsPageState extends State<ElementsPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: const Text("Elevated button"),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                child: const Text("Elevated button ON"),
                onPressed: () {},
              ),
              const ElevatedButton(
                onPressed: null,
                child: Text("Elevated button OFF"),
              ),
            ],
          ),
        ),
        ListTile(
          title: const Text("Outlined button"),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OutlinedButton(
                child: const Text("Outlined button ON"),
                onPressed: () {},
              ),
              const OutlinedButton(
                onPressed: null,
                child: Text("Outlined button OFF"),
              ),
            ],
          ),
        ),
        ListTile(
          title: const Text("TextButton button"),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                child: const Text("TextButton button ON"),
                onPressed: () {},
              ),
              const TextButton(
                onPressed: null,
                child: Text("TextButton button OFF"),
              ),
            ],
          ),
        ),
        ListTile(
          title: const Text("Material Button [abstract]"),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MaterialButton(
                onPressed: () {},
                child: const Text("Material button ON"),
              ),
              const MaterialButton(
                onPressed: null,
                child: Text("Material button OFF"),
              )
            ],
          ),
        ),
        ListTile(
          title: const Text("Switch buttons"),
          subtitle:
              SelectionItemList(items: [Text("0"), Text("2")], selectedIndex: 0),
        )
      ],
    );
  }
}
