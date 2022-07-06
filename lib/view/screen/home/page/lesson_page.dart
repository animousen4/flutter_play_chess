

import 'package:flutter/material.dart';
import 'package:flutter_play_chess/view/widget/decorated_scaffold.dart';

class LessonPage extends StatelessWidget {
  const LessonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedScaffold(
      appBar: AppBar(title: Text("Lesson"),),
    );
  }
}