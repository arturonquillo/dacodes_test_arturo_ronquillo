import 'package:dacodes_test/app/core/base/base_controller.dart';
import 'package:dacodes_test/app/data/model/story.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class StoriesController extends BaseController {
  var characterStories = RxList<Story>.empty();
  var loadingCharacterStories = false.obs;

  final characterStoriesPageController = ScrollController();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getCharacterStories();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getCharacterStories({cleanAll = false}) async {
    if (loadingCharacterStories.value) return;
    if (cleanAll) {
      characterStories.clear();
    }

    loadingCharacterStories(true);

    // Se obtiene el id del personaje enviado desde home
    int? characterId = int.tryParse(Get.parameters['characterId'] ?? "");

    // Validacion en caso de acceder a la pantalla de Stories
    //sin un id de personaje

    if (characterId == null) {
      loadingCharacterStories(false);
      return;
    }
    Map response = await marvelApiSource.characterStories(characterId,
        offset: characterStories.length);
    try {
      switch (response["code"]) {
        case 200:
          for (Map<String, dynamic> story in response["data"]["results"]) {
            try {
              characterStories.add(Story.fromJson(story));
            } catch (e) {
              Logger().e(e);
            }
          }
          break;
        default:
      }
    } on Exception catch (e) {
      Logger().e(e);
      loadingCharacterStories(false);
    }
    // Logger().d(response);
    loadingCharacterStories(false);
  }
}
