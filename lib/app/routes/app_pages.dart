import 'package:dacodes_test/app/modules/characterDetail/comics/bindings/comics_binding.dart';
import 'package:dacodes_test/app/modules/characterDetail/events/bindings/events_binding.dart';
import 'package:dacodes_test/app/modules/characterDetail/series/bindings/series_binding.dart';
import 'package:dacodes_test/app/modules/characterDetail/stories/bindings/stories_binding.dart';

import 'package:dacodes_test/app/modules/characterDetail/comics/views/comics_view.dart';
import 'package:dacodes_test/app/modules/characterDetail/events/views/events_view.dart';
import 'package:dacodes_test/app/modules/characterDetail/series/views/series_view.dart';
import 'package:dacodes_test/app/modules/characterDetail/stories/views/stories_view.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../modules/characterDetail/bindings/character_detail_binding.dart';
import '../modules/characterDetail/views/character_detail_view.dart';
import '../modules/home/bindings/home_binding.dart';

import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.CHARACTER_DETAIL,
      page: () => const CharacterDetailView(),
      binding: CharacterDetailBinding(),
      children: [
        GetPage(
          name: _Paths.CHARACTER_COMICS,
          page: () => const ComicsView(),
          binding: ComicsBinding(),
        ),
        GetPage(
          name: _Paths.CHARACTER_EVENTS,
          page: () => const EventsView(),
          binding: EventsBinding(),
        ),
        GetPage(
          name: _Paths.CHARACTER_SERIES,
          page: () => const SeriesView(),
          binding: SeriesBinding(),
        ),
        GetPage(
          name: _Paths.CHARACTER_STORIES,
          page: () => const StoriesView(),
          binding: StoriesBinding(),
        ),
      ],
    ),
  ];
}
