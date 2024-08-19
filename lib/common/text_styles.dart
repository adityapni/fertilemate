import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FBTextThemeStyle {
  static TextStyle displaySmall({Color? color, String? fontFamily}) {
    return TextStyle(
      fontSize: 57.px,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      inherit: true,
      color: color,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle displayMedium({Color? color, String? fontFamily}) {
    return TextStyle(
      fontSize: 32.px,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w800,
      inherit: true,
      color: color,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle displayLarge({Color? color, String? fontFamily}) {
    return TextStyle(
      fontSize: 36.px,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      inherit: true,
      color: color,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle headlineSmall({Color? color, String? fontFamily}) {
    return TextStyle(
      fontSize: 16.px,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      inherit: true,
      color: color,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle headlineMedium({Color? color, String? fontFamily}) {
    return TextStyle(
      fontSize: 22.px,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      inherit: true,
      color: color,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle headlineLarge({Color? color, String? fontFamily}) {
    return TextStyle(
      fontSize: 24.px,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      inherit: true,
      color: color,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle titleSmall({Color? color, String? fontFamily}) {
    return TextStyle(
      fontSize: 10.px,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      inherit: true,
      color: color,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle titleMedium({Color? color, String? fontFamily}) {
    return TextStyle(
      fontSize: 14.px,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      inherit: true,
      color: color,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle titleLarge({Color? color, String? fontFamily}) {
    return TextStyle(
      fontSize: 22.px,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      inherit: true,
      color: color,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle bodySmall({Color? color, String? fontFamily}) {
    return TextStyle(
      fontSize: 22.px,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      inherit: true,
      color: color,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle bodyMedium({Color? color, String? fontFamily}) {
    return TextStyle(
      fontSize: 16.px,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w600,
      inherit: true,
      color: color,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle bodyLarge({Color? color, String? fontFamily}) {
    return TextStyle(
      fontSize: 14.px,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w600,
      inherit: true,
      color: color,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle labelSmall({Color? color, String? fontFamily}) {
    return TextStyle(
      fontSize: 16.px,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      inherit: true,
      color: color,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle labelMedium({Color? color, String? fontFamily}) {
    return TextStyle(
      fontSize: 14.px,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      inherit: true,
      color: color,
      decoration: TextDecoration.none,
    );
  }

  static TextStyle labelLarge({Color? color, String? fontFamily}) {
    return TextStyle(
      fontSize: 12.px,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      inherit: true,
      color: color,
      decoration: TextDecoration.none,
    );
  }
}

class FBTextTheme {
  TextTheme myTextTheme({String? fontFamily, dynamic colors}) {
    String semiBold = "${fontFamily}SemiBold";
    String regular = "${fontFamily}Regular";
    String light = "${fontFamily}Light";
    String bold = "${fontFamily}Bold";
    return TextTheme(
      displaySmall: FBTextThemeStyle.displaySmall(
        color: colors.text,
        fontFamily: fontFamily,
      ),
      displayMedium: FBTextThemeStyle.displayMedium(
        color: colors.text,
        fontFamily: fontFamily,
      ),
      displayLarge: FBTextThemeStyle.displayLarge(
        color: colors.text,
        fontFamily: fontFamily,
      ),
      headlineSmall: FBTextThemeStyle.headlineSmall(
        color: colors.onText,
        fontFamily: fontFamily,
      ),
      headlineMedium: FBTextThemeStyle.headlineMedium(
        color: colors.text,
        fontFamily: fontFamily,
      ),
      headlineLarge: FBTextThemeStyle.headlineLarge(
        color: colors.text,
        fontFamily: fontFamily,
      ),
      titleSmall: FBTextThemeStyle.titleSmall(
        color: colors.caption,
        fontFamily: fontFamily,
      ),
      titleMedium: FBTextThemeStyle.titleMedium(
        color: colors.caption,
        fontFamily: fontFamily,
      ),
      titleLarge: FBTextThemeStyle.titleLarge(
        color: colors.caption,
        fontFamily: fontFamily,
      ),
      bodySmall: FBTextThemeStyle.bodySmall(
        color: colors.text,
        fontFamily: fontFamily,
      ),
      bodyMedium: FBTextThemeStyle.bodyMedium(
        color: colors.text,
        fontFamily: fontFamily,
      ),
      bodyLarge: FBTextThemeStyle.bodyLarge(
        color: colors.text,
        fontFamily: fontFamily,
      ),
      labelSmall: FBTextThemeStyle.labelSmall(
        color: colors.text,
        fontFamily: fontFamily,
      ),
      labelMedium: FBTextThemeStyle.labelMedium(
        color: colors.text,
        fontFamily: fontFamily,
      ),
      labelLarge: FBTextThemeStyle.labelLarge(
        color: colors.text,
        fontFamily: fontFamily,
      ),
    );
  }
}
