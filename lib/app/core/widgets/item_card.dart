// ignore_for_file: prefer_const_constructors

import 'package:dacodes_test/app/core/values/app_colors.dart';
import 'package:dacodes_test/app/data/model/character.dart';
import 'package:dacodes_test/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemCard extends StatelessWidget {
  String title;
  String urlImage;
  final Function() onTap;
  ItemCard(
      {super.key,
      required this.title,
      required this.urlImage,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.lightColor[300]!,
              width: 0.4,
            ),
            borderRadius: BorderRadius.circular(18)),
        // margin: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Expanded(
            flex: 3,
            child: SizedBox(
              height: 170,
              child: Image.network(
                // '${character.thumbnail!.path!}.${character.thumbnail!.extension!}',
                urlImage,
                fit: BoxFit.fitHeight,
                errorBuilder: (contex, object, stack) {
                  return Icon(
                    Icons.image_not_supported_outlined,
                    color: AppColors.lightColor,
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: AppColors.lightColor[100],
              padding: EdgeInsets.symmetric(horizontal: 6),
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                // '${character.name}',
                title,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.fade,
                style: Get.textTheme.titleMedium!
                    .copyWith(color: AppColors.darkColor),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
