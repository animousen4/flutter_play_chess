import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class DropdownPhysicalButton extends StatefulWidget {
  const DropdownPhysicalButton(
      {Key? key,
      required this.options,
      required this.selectedIndex,
      required this.callback})
      : super(key: key);
  final List<Widget> options;
  final Function(int index)? callback;
  final int selectedIndex;

  @override
  State<DropdownPhysicalButton> createState() => _DropdownPhysicalButtonState();
}

class _DropdownPhysicalButtonState extends State<DropdownPhysicalButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<double> sizeAnimation;

  bool get enabled => widget.callback != null;
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
            .headline3!
            .copyWith(color: Colors.black),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            frontFragment(widget.options[widget.selectedIndex]),
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
    for (int index = 0; index < widget.options.length; index++) {
      data.add(baseFragment(widget.options[index], color: Color.fromARGB(22, 0, 0, 0), callback: enabled
              ? () {
                  widget.callback?.call(index);
                  reExpand();
                }
              : null,));
    }
    return data;
  }

  Widget frontFragment(Widget rawWidget) => baseFragment(rawWidget, callback: enabled
          ? () {
              reExpand();
            }
          : null);

  Widget baseFragment(Widget rawWidget, {Color? color = Colors.transparent, required Function()? callback}) => InkWell(
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
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    // animationController.repeat(
    //   reverse: true,
    //   period: Duration(milliseconds: 1300)
    // );
    sizeAnimation = animationController.drive(CurveTween(curve: Curves.linear));
    //CurvedAnimation(parent: animationController, curve: Curves.linear);
    super.initState();
  }
}
