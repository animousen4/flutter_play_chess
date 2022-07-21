import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CountryView extends StatelessWidget {
  final String countryName;
  final double height;
  final double width;
  const CountryView({Key? key, required this.countryName, this.height = 20, this.width = 26.6666}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: SvgPicture.asset(
        "icons/flags/svg/$countryName.svg",
        package: "country_icons",
      ),
    );
  }
}
