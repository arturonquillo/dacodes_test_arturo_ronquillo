// ignore_for_file: prefer_const_constructors

import 'package:dacodes_test/app/core/values/app_colors.dart';
import 'package:dacodes_test/app/core/widgets/custom_icon_button.dart';
import 'package:dacodes_test/app/core/widgets/item_card.dart';
import 'package:dacodes_test/app/core/widgets/search_field_widget.dart';
import 'package:dacodes_test/app/data/model/character.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/comics_controller.dart';

class ComicsView extends GetView<ComicsController> {
  const ComicsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comics'),
        centerTitle: true,
      ),
      body: SizedBox(
        width: Get.width,
        child: Obx(() {
          if (controller.characterComics.isEmpty &&
              controller.loadingCharacterComics.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (controller.characterComics.isEmpty) {
            return Center(
              child: Text(
                "No comics here",
                textAlign: TextAlign.justify,
                style: Get.textTheme.headlineSmall!.copyWith(
                  color: AppColors.lightColor[200],
                ),
              ),
            );
          } else {
            return RawScrollbar(
              controller: controller.characterComicsPageController,
              // thumbVisibility: true,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  controller: controller.characterComicsPageController,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.55,
                  ),
                  itemCount: controller.characterComics.length,
                  itemBuilder: (context, index) {
                    // Comic a
                    var comic = controller.characterComics[index];
                    return ItemCard(
                      onTap: () {
                        // Get.toNamed(Routes.characterDetail(character.id));
                      },
                      title: "${comic.title}",
                      urlImage:
                          '${comic.thumbnail.path}.${comic.thumbnail.extension}',
                    );
                  },
                ),
              ),
            );
          }
        }),
      ),
    );
  }
}
