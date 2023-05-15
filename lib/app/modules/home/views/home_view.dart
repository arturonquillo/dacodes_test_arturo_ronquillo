// ignore_for_file: prefer_const_constructors

import 'package:dacodes_test/app/core/utils/ui_utils.dart';
import 'package:dacodes_test/app/core/values/app_colors.dart';
import 'package:dacodes_test/app/core/widgets/custom_button.dart';
import 'package:dacodes_test/app/core/widgets/custom_icon_button.dart';
import 'package:dacodes_test/app/core/widgets/item_card.dart';
import 'package:dacodes_test/app/core/widgets/search_field_widget.dart';
import 'package:dacodes_test/app/data/model/character.dart';
import 'package:dacodes_test/app/data/model/comic.dart' as dc;
import 'package:dacodes_test/app/modules/home/controllers/home_controller.dart';
import 'package:dacodes_test/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marvel Characters'),
        centerTitle: true,
      ),
      body: SizedBox(
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(top: 22, bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: CustomIconButton(
                      onPressed: () {
                        showOptionBottomSheet(
                          "Comics",
                          Container(
                            height: 290,
                            child: Column(
                              children: [
                                CustomButton(
                                    text: "Clear selection",
                                    onTap: () {
                                      controller.selectedComicId.value = 0;
                                      Get.back();
                                      controller.getCharacters(cleanAll: true);
                                    }),
                                Expanded(
                                  child: Obx(() {
                                    return ListView.builder(
                                        itemCount: controller.comics.length,
                                        controller:
                                            controller.comicsPageController,
                                        itemBuilder: (context, index) {
                                          dc.Comic comic =
                                              controller.comics[index];
                                          return RadioListTile<int>(
                                            value: comic.id!,
                                            groupValue: controller
                                                .selectedComicId.value,
                                            title: Text(comic.title),
                                            onChanged: (id) {
                                              controller.selectedComicId.value =
                                                  id!;
                                              Get.back();
                                              controller.getCharacters(
                                                  cleanAll: true);
                                            },
                                          );
                                        });
                                  }),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.filter_list_rounded,
                        color: AppColors.lightColor,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: SearchField(
                        searchAction: (text) {
                          controller.filterCharacterName.value = text;
                          controller.getCharacters(cleanAll: true);
                        },
                        buttonAction: () {
                          controller.getCharacters(cleanAll: true);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Obx(() {
                if (controller.characters.isEmpty &&
                    controller.loadingCharacters.value) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return RawScrollbar(
                    controller: controller.charactersPageController,
                    // thumbVisibility: true,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
                        controller: controller.charactersPageController,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.55,
                        ),
                        itemCount: controller.characters.length,
                        itemBuilder: (context, index) {
                          var character = controller.characters[index];
                          return ItemCard(
                            onTap: () {
                              Get.toNamed(
                                Routes.characterDetail(character.id),
                                arguments: character,
                              );
                            },
                            title: '${character.name}',
                            urlImage:
                                '${character.thumbnail!.path!}.${character.thumbnail!.extension!}',
                          );
                        },
                      ),
                    ),
                  );
                }
              }),
            )
          ],
        ),
      ),
    );
  }
}
