import 'package:fertility_boost/common/colors.dart';
import 'package:fertility_boost/common/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FBThemeData {
  static ThemeData themeData({
    String? fontFamily,
    bool lightTheme = true,
  }) {
    return ThemeData(
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: FBLightColors().primary,
          statusBarBrightness: Brightness.light, // For iOS: (dark icons)
          statusBarIconBrightness:
          Brightness.light, // For Android(M and greater): (dark icons)
        ),
      ),
      textTheme: FBTextTheme().myTextTheme(
          fontFamily: fontFamily,
          colors: lightTheme ? FBLightColors() : FBDarkColors()),
      primaryColor: lightTheme
          ? FBLightColors().primary
          : FBDarkColors().primary,
      scaffoldBackgroundColor: lightTheme
          ? FBLightColors().scaffoldBackgroundColor
          : FBDarkColors().scaffoldBackgroundColor,
      colorScheme: Methods.colorScheme(
          colors: lightTheme ? FBLightColors() : FBDarkColors(),
          lightTheme: lightTheme),
      textSelectionTheme: TextSelectionThemeData(cursorColor: FBLightColors().text),
     /* inputDecorationTheme: Methods.inputDecorationTheme(
          colors: lightTheme ? FBLightColors() : FBDarkColors()),
      elevatedButtonTheme: Methods.elevatedButtonTheme(
          colors: lightTheme ? FBLightColors() : FBDarkColors()),
      textButtonTheme: Methods.textButtonTheme(
          colors: lightTheme ? FBLightColors() : FBDarkColors()),
      outlinedButtonTheme: Methods.outlinedButtonTheme(
          colors: lightTheme ? FBLightColors() : FBDarkColors()),*/
    );
  }
}

class Methods {
  static ColorScheme colorScheme({dynamic colors, bool lightTheme = true}) {
    return ColorScheme(
      primary: colors.primary,
      onPrimary: colors.onPrimary,
      secondary: colors.scaffoldBackgroundColor,
      onSecondary: colors.caption,
      error: colors.error,
      brightness: lightTheme ? Brightness.light : Brightness.dark,
      onError: colors.success,
      background: colors.scaffoldBackgroundColor,
      onBackground: colors.scaffoldBackgroundColor,
      surface: colors.scaffoldBackgroundColor,
      onSurface: colors.onText,
      onSecondaryContainer: colors.orange,
    );
  }

  static InputDecorationTheme inputDecorationTheme({dynamic colors}) {
    return InputDecorationTheme(
      contentPadding: const EdgeInsets.only(top: 1),
      constraints: BoxConstraints(maxHeight: 70.px),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(width: 1, color: colors.onPrimary),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(width: 1, color: colors.primary),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(width: 2, color: colors.error),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide(width: 2, color: colors.error),
      ),
    );
  }

  static ElevatedButtonThemeData elevatedButtonTheme({dynamic colors}) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.px),
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
    );
  }

  static TextButtonThemeData textButtonTheme({dynamic colors}) {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.px),
        ),
        padding: EdgeInsets.zero,
        foregroundColor: colors.primary,
      ),
    );
  }

  static OutlinedButtonThemeData outlinedButtonTheme({dynamic colors}) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.px),
          ),
          foregroundColor: colors.text,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: EdgeInsets.all(3.5.px),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap),
    );
  }
}
