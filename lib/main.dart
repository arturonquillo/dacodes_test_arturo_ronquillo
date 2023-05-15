import 'package:dacodes_test/app/bindings/initial_binding.dart';
import 'package:dacodes_test/app/core/themes/dark_theme.dart';
import 'package:dacodes_test/app/data/remote/marvel_api_source.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      title: "Application",
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBindings(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: getDarkTheme(),
    ),
  );
}
