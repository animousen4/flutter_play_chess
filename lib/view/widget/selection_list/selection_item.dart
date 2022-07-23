import 'package:flutter/material.dart';
import 'package:flutter_play_chess/view/theme/app_theme.dart';
import 'package:flutter_play_chess/view/widget/const/k_const.dart';
import 'package:logger/logger.dart';

class SelectionItem extends StatelessWidget {
  final Widget? child;
  final Function(int)? callback;
  final int index;
  final bool selected;
  final bool doCenter;
  const SelectionItem(
      {Key? key,
      required this.index,
      required this.callback,
      required this.selected,
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
        color: callback == null
            ? Colors.white.withOpacity(0.6)
            : selected == true
                ? Colors.white
                : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: Colors.grey)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          child: DefaultTextStyle(
            child: doCenter ? Center(child: child) : child ?? SizedBox.shrink(), style: Theme.of(context).textTheme.bodyText2!.copyWith(
              color: callback == null ? Colors.red : selected == true ? backgroundColor : Colors.grey
            ),
          ),
          onTap: selected == null
              ? null
              : () {
                  callback?.call(index);
                },
        ),
      ),
    );
  }
}
