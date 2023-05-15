import 'package:dacodes_test/app/data/remote/marvel_api_source.dart';
import 'package:get/get.dart';

class RemoteBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MarvelApiSource>(
      () => MarvelApiSource(),
    );
  }
}
