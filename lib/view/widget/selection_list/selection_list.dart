import 'package:flutter/material.dart';
import 'package:flutter_play_chess/view/theme/selection_item_theme.dart';
import 'package:flutter_play_chess/view/widget/const/k_const.dart';
import 'package:flutter_play_chess/view/widget/selection_list/selection_item.dart';
import 'package:logger/logger.dart';

class SelectionItemList extends StatelessWidget {
  final Axis direction;
  final List<Widget> items;
  final SelectionItemThemeData? theme;
  final Function(int index)? callback; // null -> unavailable
  final List<int>? lockedIndexList; // null -> no locked items
  final List<int>? selectedIndexList; // null ->

  const SelectionItemList(
      {Key? key,
      required this.items,
      required this.callback,
      required this.selectedIndexList,
      this.theme,
      this.lockedIndexList,
      this.direction = Axis.horizontal})
      : super(key: key);
  factory SelectionItemList.radio(
          {Key? key,
          required List<Widget> items,
          required Function(int)? callback,
          required int selectedIndex,
          SelectionItemThemeData? theme,
          List<int>? lockedItemList,
          Axis direction = Axis.horizontal}) =>
      SelectionItemList(
          items: items,
          callback: callback,
          lockedIndexList: [],
          theme: theme,
          selectedIndexList: [selectedIndex]);
  @override
  Widget build(BuildContext context) {
    //assert(false);
    return Container(
      height: kDefaultSelectionSquareSize,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: 10),
        scrollDirection: direction,
        itemBuilder: (context, index) => SelectionItem(
          index: index,
          theme: theme,
          data: SelectionItemData(
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
