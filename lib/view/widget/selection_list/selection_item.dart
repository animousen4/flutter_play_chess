

import 'package:flutter/material.dart';

class SelectionItem extends StatelessWidget {
  final Widget? child;
  final bool selected;
  const SelectionItem({Key? key, required this.child, required this.selected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      child: Material(
        color: Colors.white.withOpacity(0.6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        clipBehavior: Clip.antiAlias,
        child: child,
      ),
    );
  }
}