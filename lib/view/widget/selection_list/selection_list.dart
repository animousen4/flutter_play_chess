import 'package:flutter/material.dart';
import 'package:flutter_play_chess/view/theme/selection_item_theme.dart';
import 'package:flutter_play_chess/view/widget/const/k_const.dart';
import 'package:flutter_play_chess/view/widget/selection_list/selection_item.dart';
import 'package:logger/logger.dart';

class SelectionItemList<T> extends StatelessWidget {
  final Axis direction;
  final Map<T, Widget> items;
  final SelectionItemThemeData? theme;
  final bool useDecorationCube;
  final Function(T item)? callback; // null -> unavailable
  final List<T>? lockedIndexList; // null -> no locked items
  final List<T>? selectedIndexList; // null ->

  const SelectionItemList(
      {Key? key,
      required this.items,
      required this.callback,
      required this.selectedIndexList,
      this.useDecorationCube = true,
      this.theme,
      this.lockedIndexList,
      this.direction = Axis.horizontal})
      : super(key: key);
  factory SelectionItemList.radio(
          {Key? key,
          required Map<T, Widget> items,
          required Function(T)? callback,
          required T selected,
          SelectionItemThemeData? theme,
          List<T>? lockedItemList,
          Axis direction = Axis.horizontal}) =>
      SelectionItemList(
          key: key,
          items: items,
          callback: callback,
          lockedIndexList: const [],
          theme: theme,
          selectedIndexList: [selected]);

  factory SelectionItemList.builder({
    Key? key,
    required Widget Function(T item, bool selected) builder,
    required List<T> items,
    List<T>? selectedItems,
    T? selectedItem,
    bool isRadio = false,
  }) {
    
    final Map<T, Widget> collection = {};
    for (T item in items) {
      collection.addAll({
        item: builder(
            item,
            (isRadio ? [selectedItem] : selectedItems! )
                .contains(item))
      });
    }

    return SelectionItemList(
      items: collection,
      callback: null,
      selectedIndexList: null,
      useDecorationCube: false,
    );
  }
  @override
  Widget build(BuildContext context) {
    //assert(false);
    return Container(
      height: kDefaultSelectionSquareSize,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: 10),
        scrollDirection: direction,
        itemBuilder: (context, index) => useDecorationCube ? SelectionItem<T>(
          index: items.keys.toList()[index],
          theme: theme,
          data: SelectionItemData<T>(
            selected: selectedIndexList == null
                ? false
                : selectedIndexList!.contains(items.keys.toList()[index]),
            callback: callback,
          ),
          child: items[items.keys.toList()[index]],
        ) : items[items.keys.toList()[index]],
        itemCount: items.length,
      ),
    );
  }
}
