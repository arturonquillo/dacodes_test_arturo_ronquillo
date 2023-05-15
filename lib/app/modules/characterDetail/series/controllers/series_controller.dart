import 'package:dacodes_test/app/core/base/base_controller.dart';
import 'package:dacodes_test/app/data/model/serie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class SeriesController extends BaseController {
  var characterSeries = RxList<Serie>.empty();
  var loadingCharacterSeries = false.obs;

  final characterSeriesPageController = ScrollController();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getCharacterSeries();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getCharacterSeries({cleanAll = false}) async {
    if (loadingCharacterSeries.value) return;
    if (cleanAll) {
      characterSeries.clear();
    }

    loadingCharacterSeries(true);

    // Se obtiene el id del personaje enviado desde home
    int? characterId = int.tryParse(Get.parameters['characterId'] ?? "");

    // Validacion en caso de acceder a la pantalla de Series
    //sin un id de personaje

    if (characterId == null) {
      loadingCharacterSeries(false);
      return;
    }
    Map response = await marvelApiSource.characterSeries(characterId,
        offset: characterSeries.length);
    try {
      switch (response["code"]) {
        case 200:
          for (Map<String, dynamic> serie in response["data"]["results"]) {
            try {
              characterSeries.add(Serie.fromJson(serie));
            } catch (e) {
              Logger().e(e);
            }
          }
          break;
        default:
      }
    } on Exception catch (e) {
      Logger().e(e);
      loadingCharacterSeries(false);
    }
    // Logger().d(response);
    loadingCharacterSeries(false);
  }
}
