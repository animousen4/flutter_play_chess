import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgMaterial {
  static Widget get homeBackground => SvgPicture.asset(
        "assets/svg/bg/play_bg.svg",
        fit: BoxFit.cover,
      );
  
  //static Widget get logoWhite => SvgPicture.asset("");
}

class SvgAnimatedFragments {
  static Widget get fragmentBotRect => SvgPicture.asset("assets/svg/bg/play/fragment_BOT_rect.svg");
  static Widget get fragmentCircle => SvgPicture.asset("assets/svg/bg/play/fragment_circle.svg");
  static Widget get fragmentLeftRect => SvgPicture.asset("assets/svg/bg/play/fragment_L_rect.svg");
  static Widget get fragmentRightRect => SvgPicture.asset("assets/svg/bg/play/fragment_R_rect.svg");
  static Widget get fragmentTopRect => SvgPicture.asset("assets/svg/bg/play/fragment_TOP_rect.svg");
}

class SvgIcons {
  static Widget get notificationBell =>
      SvgPicture.asset("assets/svg/icons/notification_bell.svg");
  static Widget get user => SvgPicture.asset("assets/svg/icons/user.svg");
  static Widget get logo => SvgPicture.asset("assets/svg/icons/logo.svg");
  static Widget get backIcon => SvgPicture.asset("assets/svg/icons/icon_back.svg");

  static Widget get playIconActive => SvgPicture.asset("assets/svg/icons/bottom_nav_bar/play_active.svg");
  static Widget get playIconNotActive => SvgPicture.asset("assets/svg/icons/bottom_nav_bar/play_not_active.svg");

  static Widget get profileIconActive => SvgPicture.asset("assets/svg/icons/bottom_nav_bar/profile_active.svg");
  static Widget get profileIconNotActive => SvgPicture.asset("assets/svg/icons/bottom_nav_bar/profile_not_active.svg");

  static Widget get trophyIconActive => SvgPicture.asset("assets/svg/icons/bottom_nav_bar/trophy_active.svg");
  static Widget get trophyIconNotActive => SvgPicture.asset("assets/svg/icons/bottom_nav_bar/trophy_not_active.svg");

  static Widget get lessonIconActive => SvgPicture.asset("assets/svg/icons/bottom_nav_bar/lesson_active.svg");
  static Widget get lessonIconNotActive => SvgPicture.asset("assets/svg/icons/bottom_nav_bar/lesson_not_active.svg");
}
