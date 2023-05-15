// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';

abstract class AppColors {
  // static const Color primaryColor = Color(0xFF4D1518);

  static const primaryColor = const MaterialColor(
    0xFF4D1518,
    const <int, Color>{
      50: const Color(0xFFCA8F91),
      100: const Color(0xFFB56264),
      200: const Color(0xFFAA4B4E),
      300: const Color(0xFFA03538),
      400: const Color(0xFF951E22),
      500: const Color(0xFF861B1F),
      600: const Color(0xFF77181B),
      700: const Color(0xFF681518),
      800: const Color(0xFF591214),
      900: const Color(0xFF4B0F11),
    },
  );

  static const accentColor = const MaterialColor(
    0xFF4D8AB5,
    const <int, Color>{
      50: const Color(0xFFB8D0E1),
      100: const Color(0xFF82ADCB),
      200: const Color(0xFF71A1C4),
      300: const Color(0xFF5F96BC),
      400: const Color(0xFF4D8AB5),
      500: const Color(0xFF457CA3),
      600: const Color(0xFF3E6E91),
      700: const Color(0xFF36617F),
      800: const Color(0xFF2E536D),
      900: const Color(0xFF27455B),
    },
  );
  static const darkColor = const MaterialColor(
    0xFF1E2639,
    const <int, Color>{
      50: const Color(0xFFBCBEC4),
      100: const Color(0xFF787D88),
      200: const Color(0xFF4B5161),
      300: const Color(0xFF353C4D),
      400: const Color(0xFF1E2639),
      500: const Color(0xFF1B2233),
      600: const Color(0xFF181E2E),
      700: const Color(0xFF151B28),
      800: const Color(0xFF121722),
      900: const Color(0xFF0F131D),
    },
  );

  static const lightColor = const MaterialColor(
    0xFFB9BEBA,
    const <int, Color>{
      50: const Color(0xFFDCDFDD),
      100: const Color(0xFFCED2CF),
      200: const Color(0xFFB9BEBA),
      300: const Color(0xFF828582),
      400: const Color(0xFF6F7270),
    },
  );

  static Color barrierColor = darkColor.withOpacity(0.5);

  static Color timelineDividerColor = darkColor.withOpacity(0.6);
}
