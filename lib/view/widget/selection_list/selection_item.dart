import 'package:flutter/material.dart';
import 'package:flutter_play_chess/view/theme/app_theme.dart';
import 'package:flutter_play_chess/view/widget/const/k_const.dart';
import 'package:logger/logger.dart';

class SelectionItem extends StatelessWidget {
  final Widget? child;
  final bool doCenter;
  final SelectionItemData data;
  const SelectionItem(
      {Key? key,
      required this.data,
      required this.child,
      this.doCenter = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: kDefaultTransitionDuration,
      width: kDefaultSelectionSquareSize,
      height: kDefaultSelectionSquareSize,
      decoration: BoxDecoration(
          color: data.callback == null
              ? Colors.white.withOpacity(0.6)
              : data.selected == true
                  ? Colors.white
                  : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: Colors.grey)),
      child: Material(
        color: Colors.transparent,
        //borderRadius: BorderRadius.circular(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          child: DefaultTextStyle(
            child: doCenter ? Center(child: child) : child ?? SizedBox.shrink(),
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                color: data.callback == null
                    ? Colors.red
                    : data.selected == true
                        ? backgroundColor
                        : Colors.grey),
          ),
          onTap: data.selected == null
              ? null
              : () {
                  data.callback?.call(data.index);
                },
        ),
      ),
    );
  }
}

class SelectionItemData {
  final bool selected;
  final int index;
  final Function(int)? callback; // null -> disabled

  SelectionItemData({required this.index, required this.selected, required this.callback});
}
