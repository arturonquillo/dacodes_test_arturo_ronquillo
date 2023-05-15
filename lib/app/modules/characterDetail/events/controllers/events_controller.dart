import 'package:dacodes_test/app/core/base/base_controller.dart';
import 'package:dacodes_test/app/data/model/event.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class EventsController extends BaseController {
  var characterEvents = RxList<Event>.empty();
  var loadingCharacterEvents = false.obs;

  final characterEventsPageController = ScrollController();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getCharacterEvents();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getCharacterEvents({cleanAll = false}) async {
    if (loadingCharacterEvents.value) return;
    if (cleanAll) {
      characterEvents.clear();
    }

    loadingCharacterEvents(true);

    // Se obtiene el id del personaje enviado desde home
    int? characterId = int.tryParse(Get.parameters['characterId'] ?? "");

    // Validacion en caso de acceder a la pantalla de Events
    //sin un id de personaje

    if (characterId == null) {
      loadingCharacterEvents(false);
      return;
    }
    Map response = await marvelApiSource.characterEvents(characterId,
        offset: characterEvents.length);
    try {
      switch (response["code"]) {
        case 200:
          for (Map<String, dynamic> event in response["data"]["results"]) {
            try {
              characterEvents.add(Event.fromJson(event));
            } catch (e) {
              Logger().e(e);
            }
          }
          break;
        default:
      }
    } on Exception catch (e) {
      Logger().e(e);
      loadingCharacterEvents(false);
    }
    // Logger().d(response);
    loadingCharacterEvents(false);
  }
}
