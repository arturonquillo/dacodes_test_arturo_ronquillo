import 'package:dacodes_test/app/data/remote/marvel_api_source.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  final MarvelApiSource marvelApiSource = Get.find<MarvelApiSource>();
}
