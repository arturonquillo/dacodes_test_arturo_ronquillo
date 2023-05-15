// ignore_for_file: prefer_const_constructors

import 'package:dacodes_test/app/core/values/app_colors.dart';
import 'package:dacodes_test/app/core/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final Function(String) searchAction;
  final Function() buttonAction;
  const SearchField({
    super.key,
    required this.searchAction,
    required this.buttonAction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(left: 20, right: 20, bottom: 6),
      child: TextField(
        decoration: InputDecoration(
            fillColor: AppColors.lightColor[200],
            filled: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(90),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(90),
              borderSide: BorderSide(color: AppColors.accentColor),
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: CustomIconButton(
                icon: Icon(
                  Icons.search,
                  color: AppColors.primaryColor[400],
                ),
                iconButtonType: IconButtonType.secondary,
                onPressed: () {
                  buttonAction();
                },
              ),
            )),
        onChanged: (value) => searchAction(value),
      ),
    );
  }
}
