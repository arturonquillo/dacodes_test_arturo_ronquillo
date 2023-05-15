import 'package:dacodes_test/app/core/base/base_controller.dart';
import 'package:dacodes_test/app/data/model/character.dart';
import 'package:dacodes_test/app/data/remote/marvel_api_source.dart';
import 'package:dacodes_test/app/data/model/comic.dart' as dc;

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class HomeController extends BaseController {
  // final MarvelApiSource _marvelApiSource = Get.find<MarvelApiSource>();

  final loadingCharacters = false.obs;
  final loadingComics = false.obs;

  final charactersPageController = ScrollController();
  final comicsPageController = ScrollController();

  var characters = RxList<Character>.empty();
  var comics = RxList<dc.Comic>.empty();

  var selectedComicId = 0.obs;
  var filterCharacterName = "".obs;
  @override
  void onInit() {
    getCharacters();
    getComics();

    charactersPageController.addListener(
      () {
        var nextPageTrigger =
            0.8 * charactersPageController.position.maxScrollExtent;
        if (charactersPageController.position.pixels > nextPageTrigger) {
          getCharacters();
        }
      },
    );
    comicsPageController.addListener(
      () {
        var nextPageTrigger =
            0.8 * comicsPageController.position.maxScrollExtent;
        if (comicsPageController.position.pixels > nextPageTrigger) {
          getComics();
        }
      },
    );

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getCharacters({cleanAll = false}) async {
    if (loadingCharacters.value) return;
    if (cleanAll) {
      characters.clear();
    }

    loadingCharacters(true);

    Map response = await marvelApiSource.characters(
      offset: characters.length,
      comicId: selectedComicId.value != 0 ? selectedComicId.value : null,
      text: filterCharacterName.value,
    );
    try {
      switch (response["code"]) {
        case 200:
          for (Map<String, dynamic> character in response["data"]["results"]) {
            characters.add(Character.fromJson(character));
          }
          break;
        default:
      }
    } on Exception catch (e) {
      Logger().e(e);
      loadingCharacters(false);
    }
    loadingCharacters(false);
  }

  getComics() async {
    if (loadingComics.value) return;
    loadingComics(true);

    Map response = await marvelApiSource.comics(offset: comics.length);
    try {
      switch (response["code"]) {
        case 200:
          for (Map<String, dynamic> comic in response["data"]["results"]) {
            try {
              comics.add(dc.Comic.fromJson(comic));
            } on Exception catch (e) {
              Logger().e(e);
            }
          }
          break;
        default:
      }
    } on Exception catch (e) {
      Logger().e(e);
      loadingComics(false);
    }
    loadingComics(false);
    // // Logger().d(response);
  }
}
