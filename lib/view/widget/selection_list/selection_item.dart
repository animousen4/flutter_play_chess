import 'package:flutter/material.dart';
import 'package:flutter_play_chess/view/theme/app_theme.dart';
import 'package:flutter_play_chess/view/theme/selection_item_theme.dart';
import 'package:flutter_play_chess/view/widget/const/k_const.dart';
import 'package:logger/logger.dart';

class SelectionItem<T> extends StatelessWidget {
  final Widget? child;
  final bool doCenter;
  final T index;
  final SelectionItemData<T> data;
  final SelectionItemThemeData? theme;
  SelectionItem(
      {Key? key,
      required this.data,
      required this.child,
      this.doCenter = true,
      required this.index,
      this.theme})
      : super(key: key) {
    maState = {};
    if (data.callback == null) {
      maState.add(MaterialState.disabled);
    } else {
      maState.remove(MaterialState.disabled);
    }
    if (data.selected) {
      maState.add(MaterialState.selected);
    } else {
      maState.remove(MaterialState.selected);
    }
  }

  late final Set<MaterialState> maState;

  @override
  Widget build(BuildContext context) {
    final usingTheme =
        theme ?? Theme.of(context).extension<SelectionItemThemeData>()!;

    return AnimatedContainer(
      duration: kDefaultTransitionDuration,
      width: kDefaultSelectionSquareSize,
      height: kDefaultSelectionSquareSize,
      decoration: usingTheme.decoration!.resolve(maState),
      child: Material(
        color: Colors.transparent,
        //borderRadius: BorderRadius.circular(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          child: DefaultTextStyle(
            child: doCenter ? Center(child: child) : child ?? SizedBox.shrink(),
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .merge(usingTheme.textStyle!.resolve(maState)!),
          ),
          onTap: data.selected == null
              ? null
              : () {
                  data.callback?.call(index);
                },
        ),
      ),
    );
  }
}

class SelectionItemData<T> {
  final bool selected;
  //final int index;
  final Function(T)? callback; // null -> disabled

  SelectionItemData({required this.selected, required this.callback});
}
