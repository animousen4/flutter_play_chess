import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
@RoutePage()
class PhotoViewScreen extends StatelessWidget {
  const PhotoViewScreen({Key? key, required this.tag, required this.img}) : super(key: key);

  final Widget img;
  final String tag;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black,),
      backgroundColor: Colors.black,
      body: Center(
        child: Hero(
          tag: tag,
          child: img,
        ),
      ),
    );
  }
}
