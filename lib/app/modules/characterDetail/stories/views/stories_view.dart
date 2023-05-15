// ignore_for_file: prefer_const_constructors

import 'package:dacodes_test/app/core/values/app_colors.dart';
import 'package:dacodes_test/app/core/widgets/item_card.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/stories_controller.dart';

class StoriesView extends GetView<StoriesController> {
  const StoriesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stories'),
        centerTitle: true,
      ),
      body: SizedBox(
        width: Get.width,
        child: Obx(() {
          if (controller.characterStories.isEmpty &&
              controller.loadingCharacterStories.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (controller.characterStories.isEmpty) {
            return Center(
              child: Text(
                "No stories here",
                textAlign: TextAlign.justify,
                style: Get.textTheme.headlineSmall!.copyWith(
                  color: AppColors.lightColor[200],
                ),
              ),
            );
          } else {
            return RawScrollbar(
              controller: controller.characterStoriesPageController,
              // thumbVisibility: true,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  controller: controller.characterStoriesPageController,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.55,
                  ),
                  itemCount: controller.characterStories.length,
                  itemBuilder: (context, index) {
                    // story a
                    var story = controller.characterStories[index];
                    return ItemCard(
                      onTap: () {
                        // Get.toNamed(Routes.characterDetail(character.id));
                      },
                      title: "${story.title}",
                      urlImage:
                          '${story.thumbnail?.path}.${story.thumbnail?.extension}',
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
