// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:dacodes_test/app/core/values/app_colors.dart';
import 'package:dacodes_test/app/data/model/character.dart';
import 'package:dacodes_test/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  String text;

  final Function() onTap;
  CustomButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
        AppColors.primaryColor[400]!,
      )),
      child: Text(
        text,
        style: Get.textTheme.headlineSmall!.copyWith(
          color: AppColors.lightColor[200],
        ),
      ),
      onPressed: onTap,
    );
  }
}
