// ignore_for_file: prefer_const_constructors

import 'package:dacodes_test/app/core/values/app_colors.dart';
import 'package:dacodes_test/app/core/widgets/item_card.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/series_controller.dart';

class SeriesView extends GetView<SeriesController> {
  const SeriesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Series'),
        centerTitle: true,
      ),
      body: SizedBox(
        width: Get.width,
        child: Obx(() {
          if (controller.characterSeries.isEmpty &&
              controller.loadingCharacterSeries.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (controller.characterSeries.isEmpty) {
            return Center(
              child: Text(
                "No series here",
                textAlign: TextAlign.justify,
                style: Get.textTheme.headlineSmall!.copyWith(
                  color: AppColors.lightColor[200],
                ),
              ),
            );
          } else {
            return RawScrollbar(
              controller: controller.characterSeriesPageController,
              // thumbVisibility: true,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  controller: controller.characterSeriesPageController,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.55,
                  ),
                  itemCount: controller.characterSeries.length,
                  itemBuilder: (context, index) {
                    // serie a
                    var serie = controller.characterSeries[index];
                    return ItemCard(
                      onTap: () {
                        // Get.toNamed(Routes.characterDetail(character.id));
                      },
                      title: "${serie.title}",
                      urlImage:
                          '${serie.thumbnail.path}.${serie.thumbnail.extension}',
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
