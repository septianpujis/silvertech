// ignore_for_file: library_private_types_in_public_api

import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import '../constants/icons.dart';
import '../constants/spacing.dart';
import '../constants/colors.dart';
import '../constants/font.dart';

// enum ChipType { iconChip, textOnly /*back Chip*/ }

enum ChipState { primary, alert, danger, neutral, success, secondary }

enum ChipSize {
  large /*footer Chip & simple Chip*/,
  normal /*dialog Chip*/
}

class OntegoChip extends StatelessWidget {
  OntegoChip({
    Key? key,
    // this.kVal,
    // this.type = ChipType.iconText,
    this.bold = false,
    this.withIcon = true,
    this.state = ChipState.primary,
    this.size = ChipSize.large,
    this.hardwareKey,
    required this.label,
    this.flex,
    // this.color = AppColors.blueChip,
    // this.highlight = AppColors.highlightDefault,
    this.icon = AppIcons.bookmark,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0,
    this.borderRadius,
    this.enabled = true,
    this.textAlignment,
    this.functionChip,
    this.functionKey,
    this.isFlexible = false,
    // this.autofocus = false,
    required this.onPressed,
  }) : super(key: key);

  // constant objects could be eliminated with enhanced-enums
  // 'enhanced-enums' are not supported within the current Dart SDK requirement
  static const _ColorScheme primary = _ColorScheme(
    AppColors.P20,
    AppColors.P80,
  );

  static const _ColorScheme alert = _ColorScheme(
    AppColors.A30,
    AppColors.A90,
  );
  static const _ColorScheme danger = _ColorScheme(
    AppColors.D20,
    AppColors.D80,
  );
  static const _ColorScheme neutral = _ColorScheme(
    AppColors.N20,
    AppColors.N70,
  );
  static const _ColorScheme success = _ColorScheme(
    AppColors.S30,
    AppColors.S90,
  );
  static const _ColorScheme secondary = _ColorScheme(
    AppColors.SEC20,
    AppColors.SEC90,
  );
  static const _ColorScheme disabled = _ColorScheme(
    AppColors.N20,
    AppColors.N30,
  );

  void chooseScheme(ChipState chipState) {
    switch (chipState) {
      case ChipState.primary:
        scheme = primary;
        break;
      case ChipState.alert:
        scheme = alert;
        break;
      case ChipState.danger:
        scheme = danger;
        break;
      case ChipState.neutral:
        scheme = neutral;
        break;
      case ChipState.success:
        scheme = success;
        break;
      case ChipState.secondary:
        scheme = secondary;
        break;
      default:
        scheme = primary;
    }
  }

  // final ChipType? type;
  final bool? bold;
  final bool? withIcon;
  final ChipState state;
  _ColorScheme scheme = primary;
  final ChipSize size;
  final Icon? hardwareKey;
  // final kVal;
  final String label;
  final int? flex;
  final Function onPressed;
  // final Color color;
  // final Color? highlight;
  final IconData? icon;
  final Color borderColor;
  final double borderWidth;
  final BorderRadius? borderRadius;
  final bool? enabled;
  final MainAxisAlignment? textAlignment;
  final String? functionChip;
  final Widget? functionKey;
  final bool? isFlexible;
  // final bool autofocus;
  final double minimalWidth = 160;
  final double maximalWidth = 320; //needs to be implemented

  @override
  Widget build(BuildContext context) {
    chooseScheme(state);
    if (withIcon!) {
      return Chip(
        avatar: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: Icon(icon),
        ),
        label: Text(label),
      );
    }
    if (!withIcon!) {
      return Chip(
        // avatar: CircleAvatar(
        //   backgroundColor: Colors.transparent,
        //   child: const Text('AB'),
        // ),
        padding: const EdgeInsets.symmetric(
            vertical: AppSpacing.space1, horizontal: AppSpacing.space3),
        label: Text(label),
      );
    } else {
      return Chip(
        avatar: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: Icon(icon),
        ),
        label: const Text('Sample Chip'),
      );
    }
  }
}

class _ColorScheme {
  const _ColorScheme(this.ChipColor, this.textColor);

  final Color ChipColor;
  final Color textColor;
}
