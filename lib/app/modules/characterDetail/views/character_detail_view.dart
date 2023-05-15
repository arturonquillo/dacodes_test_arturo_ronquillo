// ignore_for_file: prefer_const_constructors

import 'package:dacodes_test/app/core/values/app_colors.dart';
import 'package:dacodes_test/app/core/widgets/custom_button.dart';
import 'package:dacodes_test/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../controllers/character_detail_controller.dart';

class CharacterDetailView extends GetView<CharacterDetailController> {
  const CharacterDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.characterDetail.name!),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            opacity: 0.05,
            fit: BoxFit.fitHeight,
            image: NetworkImage(
                '${controller.characterDetail.thumbnail!.path!}.${controller.characterDetail.thumbnail!.extension!}'),
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
        child: Column(
          children: [
            //Descripcion
            Container(
              padding: const EdgeInsets.only(top: 18.0),
              child: Text(
                (controller.characterDetail.description == null ||
                        controller.characterDetail.description!.trim() == "")
                    ? "Sin descripcion"
                    : controller.characterDetail.description!,
                textAlign: TextAlign.justify,
                style: Get.textTheme.headlineSmall!.copyWith(
                  color: AppColors.lightColor[200],
                ),
              ),
            ),
            Container(
              height: 150,
              child: ListView.builder(
                  itemCount: controller.characterDetail.urls!.length,
                  itemBuilder: (context, index) {
                    return TextButton(
                        onPressed: () async {
                          String url =
                              controller.characterDetail.urls![index]!.url!;
                          if (!await launchUrlString(url)) {
                            throw Exception('Could not launch $url');
                          }
                        },
                        child: Text(
                            controller.characterDetail.urls![index]!.type!));
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 28.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton(
                      text: "Comics",
                      onTap: () {
                        Get.toNamed(Routes.characterComics(
                            int.parse(Get.parameters["characterId"]!)));
                      }),
                  CustomButton(
                      text: "Events",
                      onTap: () {
                        Get.toNamed(Routes.characterEvents(
                            int.parse(Get.parameters["characterId"]!)));
                      }),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                    text: "Series",
                    onTap: () {
                      Get.toNamed(Routes.characterSeries(
                          int.parse(Get.parameters["characterId"]!)));
                    }),
                CustomButton(
                    text: "Stories",
                    onTap: () {
                      Get.toNamed(Routes.characterStories(
                          int.parse(Get.parameters["characterId"]!)));
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
