import 'package:flutter/material.dart';

class ResponsiveHelper {
  double maxMobileAspectRatio;
  BuildContext context;

  ResponsiveHelper({required this.maxMobileAspectRatio, required this.context});

  bool get isDesktop {
    Size size = MediaQuery.of(context).size;
    return size.width / size.height > maxMobileAspectRatio;
  }
}
