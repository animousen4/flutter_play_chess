import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class DropdownPhysicalButton<T> extends StatefulWidget {
  const DropdownPhysicalButton(
      {Key? key,
      required this.options,
      required this.selected,
      required this.callback,
      this.duration = const Duration(milliseconds: 200)})
      : super(key: key);
  final Map<T, Widget> options;
  final Duration duration;
  final void Function(T item)? callback;
  final T selected;

  factory DropdownPhysicalButton.builder(
      {required Widget Function(BuildContext context, int index) builder,
      required int itemCount,
      required int selectedIndex,
      required void Function(int index)? callback}) {
    Map<int, Widget> options = {};
    for (int i = 0; i < itemCount; i++) {
      options.addAll({i: Builder(builder: (context) => builder(context, i))});
    }
    return DropdownPhysicalButton<int>(
        options: options,
        selected: selectedIndex,
        callback: callback) as DropdownPhysicalButton<T>;
  }

  @override
  State<DropdownPhysicalButton> createState() =>
      _DropdownPhysicalButtonState<T>();
}

class _DropdownPhysicalButtonState<T> extends State<DropdownPhysicalButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<double> sizeAnimation;

  bool get enabled => (widget as DropdownPhysicalButton<T>).callback != null;
  bool expanded = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8),
      clipBehavior: Clip.antiAlias,
      color: Colors.white,
      child: DefaultTextStyle(
        style: Theme.of(context)
            .textTheme
            .displaySmall!
            .copyWith(color: Colors.black),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            frontFragment(widget.options[widget.selected]!),
            SizeTransition(
                sizeFactor: sizeAnimation,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: variants(),
                )),
          ],
        ),
      ),
    );
  }

  List<Widget> variants() {
    final data = <Widget>[];
    for (dynamic key in widget.options.keys) {
      data.add(baseFragment(
        widget.options[key]!,
        color: Color.fromARGB(22, 0, 0, 0),
        callback: enabled
            ? () {
                (widget as DropdownPhysicalButton<T>).callback?.call(key);
                reExpand();
              }
            : null,
      ));
    }
    return data;
  }

  Widget frontFragment(Widget rawWidget) => baseFragment(rawWidget,
      callback: enabled
          ? () {
              reExpand();
            }
          : null);

  Widget baseFragment(Widget rawWidget,
          {Color? color = Colors.transparent, required Function()? callback}) =>
      InkWell(
        onTap: callback,
        child: Container(
          color: color,
          child: Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15, left: 21),
            child: Container(
              constraints: BoxConstraints(),
              child: rawWidget,
              width: double.infinity,
            ),
          ),
        ),
      );

  void reExpand() {
    expanded = !expanded;

    //Logger().d("reExpand, expanded = $expanded");
    if (expanded) {
      animationController.forward();
      return;
    }

    animationController.reverse();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: widget.duration);
    // animationController.repeat(
    //   reverse: true,
    //   period: Duration(milliseconds: 1300)
    // );
    sizeAnimation = animationController.drive(CurveTween(curve: Curves.linear));
    //CurvedAnimation(parent: animationController, curve: Curves.linear);
    super.initState();
  }
}
