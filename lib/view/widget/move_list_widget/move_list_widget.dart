import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class MoveListWidget extends StatefulWidget {
  final List<String> sanMoves;
  final int currentHalfMove;
  final Function(int index)? onSelectMove;
  const MoveListWidget(
      {super.key, required this.sanMoves, required this.currentHalfMove, this.onSelectMove});

  @override
  State<MoveListWidget> createState() => _MoveListWidgetState();
}

class _MoveListWidgetState extends State<MoveListWidget> {

  final ScrollController _controller = ScrollController();

    void _scrollDown() {
    _controller.jumpTo(_controller.position.maxScrollExtent);
  }

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
                 _controller.animateTo(
                 _controller.position.maxScrollExtent,
                 duration: const Duration(milliseconds: 200),
                 curve: Curves.fastOutSlowIn);
                 });
    return SizedBox(
        height: 30,
        child: ListView.builder(
          controller: _controller,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Row(
            children: [
              Text("${index % 2 == 0 ? "${getMove(index)}. " : ""} "),
              Text(widget.sanMoves[index], style: widget.currentHalfMove == index + 1 ? TextStyle(color: Colors.blue) : null,),
              (index + 1 <= widget.sanMoves.length) && ((index + 1) % 2) == 0 ? SizedBox(width: 12) : SizedBox(),
            ],
          ),
          itemCount: widget.sanMoves.length,
        ));
  }

  int getMove(int halfMove) => halfMove ~/ 2 + 1;
}
