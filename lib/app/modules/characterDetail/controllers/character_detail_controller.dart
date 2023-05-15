import 'package:dacodes_test/app/core/base/base_controller.dart';
import 'package:dacodes_test/app/data/model/character.dart';
import 'package:get/get.dart';

class CharacterDetailController extends BaseController {
  //TODO: Implement CharacterDetailController
  var loadingCharacterDetail = false.obs;
  late Character characterDetail;

  final count = 0.obs;
  @override
  void onInit() {
    characterDetail = Get.arguments as Character;
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

  // getCharacterDetail({cleanAll = false}) async {
  //   if (loadingCharacterDetail.value) return;
  //   if (cleanAll) {
  //     characterComics.clear();
  //   }

  //   loadingCharacterDetail(true);

  //   // Se obtiene el id del personaje enviado desde home
  //   int? characterId = int.tryParse(Get.parameters['characterId'] ?? "");

  //   // Validacion en caso de acceder a la pantalla de comics
  //   //sin un id de personaje

  //   if (characterId == null) {
  //     loadingCharacterDetail(false);
  //     return;
  //   }
  //   Map response = await marvelApiSource.characterComics(characterId,
  //       offset: characterComics.length);
  //   try {
  //     switch (response["code"]) {
  //       case 200:
  //         for (Map<String, dynamic> comic in response["data"]["results"]) {
  //           try {
  //             characterComics.add(Comic.fromJson(comic));
  //           } catch (e) {
  //             Logger().e(e);
  //           }
  //         }
  //         break;
  //       default:
  //     }
  //   } on Exception catch (e) {
  //     Logger().e(e);
  //     loadingCharacterDetail(false);
  //   }
  //   // Logger().d(response);
  //   loadingCharacterDetail(false);
  // }
}
