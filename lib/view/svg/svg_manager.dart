import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgMaterial {
  static Widget get homeBackground => SvgPicture.asset(
        "assets/svg/bg/play_bg.svg",
        fit: BoxFit.cover,
      );
  
  static Widget get logoWhite => SvgPicture.asset("");
}

class SvgIcons {
  static Widget get notificationBell =>
      SvgPicture.asset("assets/svg/icons/notification_bell.svg");
  static Widget get user => SvgPicture.asset("assets/svg/icons/user.svg");
  static Widget get logo => SvgPicture.asset("assets/svg/icons/logo.svg");
}
