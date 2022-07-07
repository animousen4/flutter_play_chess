import 'package:flutter/material.dart';
import 'package:flutter_play_chess/view/widget/selection_list/selection_item.dart';

class SelectionItemList extends StatelessWidget {
  final Axis direction;
  final List<Widget> items;
  final int selectedIndex;
  const SelectionItemList(
      {Key? key,
      required this.items,
      required this.selectedIndex,
      this.direction = Axis.horizontal})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: ListView.builder(
        scrollDirection: direction,
        itemBuilder: (context, index) => SelectionItem(
          selected: selectedIndex == index,
          child: items[index],
        ),
        itemCount: items.length,
      ),
    );
  }
}
