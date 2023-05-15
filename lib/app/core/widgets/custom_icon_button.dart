// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:dacodes_test/app/core/values/app_colors.dart';
import 'package:flutter/material.dart';

/// {@category Elements}
class CustomIconButton extends StatelessWidget {
  final bool enabled;
  final Function() onPressed;
  final Function()? onLongPressed;

  final Widget icon;
  final IconButtonType iconButtonType;
  final String? tooltipMessage;
  final double size;

  CustomIconButton({
    Key? key,
    required this.onPressed,
    this.enabled = true,
    required this.icon,
    this.iconButtonType = IconButtonType.primary,
    this.onLongPressed,
    this.tooltipMessage,
    this.size = 40.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color pressedColor;
    Color iconColor;
    Color borderColor;

    switch (iconButtonType) {
      case IconButtonType.primary:
        backgroundColor =
            enabled ? AppColors.primaryColor[400]! : AppColors.darkColor[200]!;
        pressedColor = AppColors.primaryColor[500]!;
        iconColor = enabled ? Colors.white : AppColors.darkColor[500]!;
        borderColor = Colors.transparent;
        break;
      case IconButtonType.secondary:
        backgroundColor =
            enabled ? Colors.transparent : AppColors.darkColor[100]!;
        pressedColor = AppColors.accentColor[200]!;
        iconColor =
            enabled ? AppColors.primaryColor[400]! : AppColors.darkColor[500]!;
        borderColor = AppColors.primaryColor[400]!;

        break;
    }

    return UnconstrainedBox(
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(4),
          shape: BoxShape.circle,
          border: Border.all(width: 2, color: borderColor),
        ),
        child: Material(
          borderRadius: BorderRadius.circular(40),
          clipBehavior: Clip.hardEdge,
          color: backgroundColor,
          child: InkWell(
            splashColor: pressedColor,
            highlightColor: AppColors.accentColor.withOpacity(0.2),
            onTap: enabled
                ? () {
                    onPressed();
                    // SessionObserver.local.restartCounter();
                  }
                : null,
            onLongPress: onLongPressed,
            child: Tooltip(
              message: tooltipMessage ?? "",
              child: icon,
            ),
          ),
        ),
      ),
    );
  }
}

enum IconButtonType { primary, secondary }
