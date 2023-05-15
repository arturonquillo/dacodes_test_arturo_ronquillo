// ignore_for_file: prefer_const_constructors

import 'package:dacodes_test/app/core/values/app_colors.dart';
import 'package:dacodes_test/app/core/widgets/custom_icon_button.dart';
import 'package:dacodes_test/app/core/widgets/item_card.dart';
import 'package:dacodes_test/app/core/widgets/search_field_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/events_controller.dart';

class EventsView extends GetView<EventsController> {
  const EventsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Events'),
        centerTitle: true,
      ),
      body: SizedBox(
        width: Get.width,
        child: Obx(() {
          if (controller.characterEvents.isEmpty &&
              controller.loadingCharacterEvents.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (controller.characterEvents.isEmpty) {
            return Center(
              child: Text(
                "No events here",
                textAlign: TextAlign.justify,
                style: Get.textTheme.headlineSmall!.copyWith(
                  color: AppColors.lightColor[200],
                ),
              ),
            );
          } else {
            return RawScrollbar(
              controller: controller.characterEventsPageController,
              // thumbVisibility: true,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  controller: controller.characterEventsPageController,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.55,
                  ),
                  itemCount: controller.characterEvents.length,
                  itemBuilder: (context, index) {
                    // Comic a
                    var event = controller.characterEvents[index];
                    return ItemCard(
                      onTap: () {
                        // Get.toNamed(Routes.characterDetail(character.id));
                      },
                      title: "${event.title}",
                      urlImage:
                          '${event.thumbnail.path}.${event.thumbnail.extension}',
                    );
                  },
                ),
              ),
            );
          }
        }),
      ),
    );
  }
}
