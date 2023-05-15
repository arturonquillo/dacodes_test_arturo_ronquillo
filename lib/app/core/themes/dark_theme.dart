// ignore_for_file: prefer_const_constructors

import 'package:dacodes_test/app/core/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

getDarkTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.darkColor[400],
    fontFamily: "Comics",
    // textTheme: TextTheme(
    //   headlineLarge: TextStyle(
    //     fontSize: 48,
    //     fontWeight: FontWeight.w400,
    //   ),
    //   headlineMedium: TextStyle(
    //     fontSize: 34,
    //     fontWeight: FontWeight.w400,
    //   ),
    //   headlineSmall: TextStyle(
    //     fontSize: 24,
    //     fontWeight: FontWeight.w400,
    //   ),
    //   displayLarge:
    // ),
    scrollbarTheme: ScrollbarThemeData().copyWith(
      thumbVisibility: MaterialStatePropertyAll(true),
      thumbColor: MaterialStatePropertyAll(Colors.grey[500]),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryColor[700],
      titleTextStyle: Get.textTheme.bodyMedium!.copyWith(
        color: AppColors.lightColor[100],
        fontFamily: "Spiderman",
        fontSize: 40,
      ),
      // iconTheme: IconThemeData(
      //   color: CColors.primaryColor[300],
      // ),
      elevation: 0.0,
    ),

    // buttonTheme: ButtonThemeData(
    //   buttonColor: Colors.yellow,
    //   textTheme: ButtonTextTheme.primary,
    // ),
    // buttonColor: AppColors.primaryColor,
    buttonTheme: ButtonThemeData(buttonColor: AppColors.primaryColor),
    // filledButtonTheme: FilledButtonThemeData(
    //   style: ButtonStyle(
    //     backgroundColor: MaterialStatePropertyAll(
    //       AppColors.primaryColor[400]!,
    //     ),
    //   ),
    // ),
    splashColor: AppColors.primaryColor,
    highlightColor: AppColors.accentColor[100],
  );
}
