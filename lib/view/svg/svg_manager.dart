import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgManager {
  static Widget get homeBackground => SvgPicture.asset("assets/bg/play_bg.svg", fit: BoxFit.cover,);
}