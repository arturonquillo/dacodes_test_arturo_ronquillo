import 'package:dacodes_test/app/core/base/base_controller.dart';
import 'package:dacodes_test/app/data/model/comic.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class ComicsController extends BaseController {
  var characterComics = RxList<Comic>.empty();
  var loadingCharacterComics = false.obs;

  final characterComicsPageController = ScrollController();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getCharacterComics();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getCharacterComics({cleanAll = false}) async {
    if (loadingCharacterComics.value) return;
    if (cleanAll) {
      characterComics.clear();
    }

    loadingCharacterComics(true);

    // Se obtiene el id del personaje enviado desde home
    int? characterId = int.tryParse(Get.parameters['characterId'] ?? "");

    // Validacion en caso de acceder a la pantalla de comics
    //sin un id de personaje

    if (characterId == null) {
      loadingCharacterComics(false);
      return;
    }
    Map response = await marvelApiSource.characterComics(characterId,
        offset: characterComics.length);
    try {
      switch (response["code"]) {
        case 200:
          for (Map<String, dynamic> comic in response["data"]["results"]) {
            try {
              characterComics.add(Comic.fromJson(comic));
            } catch (e) {
              Logger().e(e);
            }
          }
          break;
        default:
      }
    } on Exception catch (e) {
      Logger().e(e);
      loadingCharacterComics(false);
    }
    // Logger().d(response);
    loadingCharacterComics(false);
  }
}
