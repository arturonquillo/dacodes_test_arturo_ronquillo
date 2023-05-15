part of 'app_pages.dart';
// DO NOT EDIT. This is code generated via package:get_cli/get_cli.dart

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;

  static get characterComics =>
      (int characterId) => (_Paths.CHARACTER_DETAIL + _Paths.CHARACTER_COMICS)
          .replaceAll(":characterId", characterId.toString());

  static get characterEvents =>
      (int characterId) => (_Paths.CHARACTER_DETAIL + _Paths.CHARACTER_EVENTS)
          .replaceAll(":characterId", characterId.toString());

  static get characterSeries =>
      (int characterId) => (_Paths.CHARACTER_DETAIL + _Paths.CHARACTER_SERIES)
          .replaceAll(":characterId", characterId.toString());

  static get characterStories =>
      (int characterId) => (_Paths.CHARACTER_DETAIL + _Paths.CHARACTER_STORIES)
          .replaceAll(":characterId", characterId.toString());

  static get characterDetail => (int characterId) => (_Paths.CHARACTER_DETAIL)
      .replaceAll(":characterId", characterId.toString());
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const CHARACTER_COMICS = '/comics';
  static const CHARACTER_EVENTS = '/events';
  static const CHARACTER_SERIES = '/series';
  static const CHARACTER_STORIES = '/stories';
  static const CHARACTER_DETAIL = '/character-detail/:characterId';
}
