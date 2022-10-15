import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_play_chess/view/widget/bullet_dot/bullet_dot.dart';
import 'package:flutter_play_chess/view/widget/short_stats/short_element.dart';

class ShortStatsWidget extends StatelessWidget {
  const ShortStatsWidget({Key? key}) : super(key: key);

  static const dot1 = BulletDot(
    colors: [
      Color.fromARGB(179, 163, 79, 247),
      Color.fromARGB(255, 44, 5, 200),
    ],
    backgroundColor: Color.fromARGB(255, 53, 157, 158),
  );
  static const dot2 = BulletDot(
    backgroundColor: Colors.white,
  );

  static const dot3 = BulletDot(
    backgroundColor: Color(0xFFA5A6F6),
  );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
              child: Column(
            children: [
              ShortStatElement(
                  name: Text("Wins"), value: Text("203"), leading: dot1),
              SizedBox(
                height: 20,
              ),
              ShortStatElement(
                name: Text("Defeats"),
                value: Text("5"),
                leading: dot2,
              ),
              SizedBox(
                height: 20,
              ),
              ShortStatElement(
                name: Text("Draws"),
                value: Text("20"),
                leading: dot3,
              )
            ],
          )),
          Expanded(
            child: Placeholder(fallbackHeight: 100),
          ),
        ],
      ),
    );
  }
}
