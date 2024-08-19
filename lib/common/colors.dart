import 'package:flutter/material.dart';

abstract class FBColors {
  Color get primary;

  Color get onPrimary;

  Color get scaffoldBackgroundColor;

  Color get success;

  Color get error;

  Color get caption;

  Color get text;

  Color get onText;

  Color get orange;
}

class FBLightColors extends FBColors {
  @override
  Color get primary => const Color(0xff115571);

  @override
  Color get caption => const Color(0xff9E9FA5);

  @override
  Color get error => const Color(0xffff0000);

  @override
  Color get onText => const Color(0xffFFFFFF);

  @override
  Color get scaffoldBackgroundColor => const Color(0xffFFFFFF);

  @override
  Color get text => const Color(0xff1E1E1E);

  @override
  Color get success => const Color(0xff4BB543);

  @override
  Color get onPrimary => const Color(0xffE3E3E3);

  @override
  Color get orange => const Color(0xffFD8D14);
}

class FBDarkColors extends FBColors {
  @override
  Color get primary => const Color(0xff115571);

  @override
  Color get caption => const Color(0xff9E9FA5);

  @override
  Color get error => const Color(0xffff0000);

  @override
  Color get onText => const Color(0xffFFFFFF);

  @override
  Color get scaffoldBackgroundColor => const Color(0xffFFFFFF);

  @override
  Color get text => const Color(0xff1E1E1E);

  @override
  Color get success => const Color(0xff4BB543);

  @override
  Color get onPrimary => const Color(0xffE3E3E3);

  @override
  Color get orange => const Color(0xffFD8D14);
}
