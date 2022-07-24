import 'package:flutter/material.dart';
import 'package:flutter_play_chess/view/widget/const/k_const.dart';
import 'package:flutter_play_chess/view/widget/selection_list/selection_item.dart';
import 'package:logger/logger.dart';

class SelectionItemList extends StatelessWidget {
  final Axis direction;
  final List<Widget> items;
  final Function(int)? callback; // null -> unavailable
  final List<int>? lockedItemList; // null -> no locked items
  final List<int>? selectedIndexList; // null -> 


  const SelectionItemList(
      {Key? key,
      required this.items,
      required this.callback,
      required this.selectedIndexList,
      this.lockedItemList,
      this.direction = Axis.horizontal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kDefaultSelectionSquareSize,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: 10),
        scrollDirection: direction,
        itemBuilder: (context, index) => SelectionItem(
          data: SelectionItemData(
            index: index,
            selected: selectedIndexList == null
              ? false
              : selectedIndexList!.contains(index),
            callback: callback,
          ),
          child: items[index],
        ),
        itemCount: items.length,
      ),
    );
  }
}
