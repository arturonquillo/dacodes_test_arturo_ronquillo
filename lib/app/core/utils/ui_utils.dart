// ignore_for_file: prefer_const_constructors

import 'package:dacodes_test/app/core/values/app_colors.dart';
import 'package:dacodes_test/app/core/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

showOptionBottomSheet(String title, Widget content) async {
  var dialog = SafeArea(
    top: false,
    bottom: false,
    child: SingleChildScrollView(
      child: Column(
        children: [
          /// Header
          Container(
            padding: EdgeInsets.only(left: 16, right: 10, top: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  // margin: EdgeInsets.all(20),

                  child: Text(
                    title,
                    style: Get.textTheme.headline4!.copyWith(
                      height: 1.8,
                      color: AppColors.darkColor[300],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                CustomIconButton(
                  size: 35,
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.close,
                    size: 22,
                    color: AppColors.primaryColor[400],
                  ),
                  iconButtonType: IconButtonType.secondary,
                )
              ],
            ),
          ),

          content
        ],
      ),
    ),
  );

  await Get.bottomSheet(Container(
    // height: 400,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        )),
    child: dialog,
  ));
}
