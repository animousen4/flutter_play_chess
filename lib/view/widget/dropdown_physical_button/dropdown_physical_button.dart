import 'package:flutter/material.dart';

class DropdownPhysicalButton extends StatefulWidget {
  const DropdownPhysicalButton(
      {Key? key, required this.options, required this.selectedIndex})
      : super(key: key);
  final List<Widget> options;
  final int selectedIndex;

  @override
  State<DropdownPhysicalButton> createState() => _DropdownPhysicalButtonState();
}

class _DropdownPhysicalButtonState extends State<DropdownPhysicalButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<double> sizeAnimation;
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
                  children: [
                    ...variants()
                  ],
                )),
          ],
        ),
      ),
    );
  }

  List<Widget> variants() {
    final data = <Widget>[];
    for (int index = 0; index < widget.options.length; index++) {
      data.add(InkWell(
          onTap: () {
            expanded = !expanded;
            reevaluateState();
          },
          child: fragment(widget.options[index])));
    }
    return data;
  }

  Widget frontFragment(Widget rawWidget) => InkWell(
      onTap: () {
        print("object");
        expanded = !expanded;
        reevaluateState();
      },
      child: fragment(rawWidget));

  Widget fragment(Widget rawWidget) => Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 15, left: 21),
        child: rawWidget,
      );
  void reevaluateState() {
    if (expanded) {
      animationController.reverse();
      return;
    }

    animationController.forward();
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
