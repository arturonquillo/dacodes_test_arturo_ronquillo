import 'package:get/get.dart';

import '../controllers/character_detail_controller.dart';

class CharacterDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CharacterDetailController>(
      () => CharacterDetailController(),
    );
  }
}
