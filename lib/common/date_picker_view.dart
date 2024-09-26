import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PickDate {
  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
  static Future<DateTime?> pickDateView({
    required Color color,
  }) {
    final kLastDay = DateTime(
        DateTime.now().year, DateTime.now().month + 3, DateTime.now().day);
    // MaterialColor materialColor = MaterialColor(
    //   color.value,
    //   <int, Color>{
    //     50: const Color(0xFFFFF8E1),
    //     100: const Color(0xFFFFECB3),
    //     200: const Color(0xFFFFE082),
    //     300: const Color(0xFFFFD54F),
    //     400: const Color(0xFFFFCA28),
    //     500: color,
    //     600: const Color(0xFFFFB300),
    //     700: const Color(0xFFFFA000),
    //     800: const Color(0xFFFF8F00),
    //     900: const Color(0xFFFF6F00),
    //   },
    // );
    return showDatePicker(
      context: Get.context!,
      builder: (context, child) {
        return Theme(
          data: ThemeData(
            brightness: Theme.of(context).brightness,
            primarySwatch: createMaterialColor(color),
            colorScheme: ColorScheme.light(primary: color),
            // cardColor:  color,
          ),
          child: child ?? const SizedBox(),
        );
      },
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: kLastDay,
    );
  }
}
