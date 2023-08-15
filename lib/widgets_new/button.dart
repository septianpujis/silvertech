// ignore_for_file: library_private_types_in_public_api

import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import '../constants/colors.dart';
import '../constants/spacing.dart';
import '../constants/font.dart';

enum ButtonType { iconText, iconOnly /*back button*/ }

enum ButtonVariant { primary, secondary, alert, danger, tertiary }

enum ButtonSize {
  large /*footer button & simple button*/,
  normal /*dialog button*/
}

class Button extends StatelessWidget {
  Button({
    Key? key,
    // this.kVal,
    this.type = ButtonType.iconText,
    this.variant = ButtonVariant.primary,
    this.size = ButtonSize.large,
    this.hardwareKey,
    this.label,
    this.flex,
    // this.color = AppColors.blueButton,
    // this.highlight = AppColors.highlightDefault,
    this.icon,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0,
    this.borderRadius,
    this.enabled = true,
    this.textAlignment,
    this.functionButton,
    this.functionKey,
    this.isFlexible = false,
    // this.autofocus = false,
    required this.onPressed,
  }) : super(key: key);

  // constant objects could be eliminated with enhanced-enums
  // 'enhanced-enums' are not supported within the current Dart SDK requirement
  static const _ColorScheme primary = _ColorScheme(
    AppColors.P40,
    AppColors.N00,
    AppColors.P60,
    AppColors.N00,
  );
  static const _ColorScheme secondary = _ColorScheme(
    AppColors.N10,
    AppColors.P40,
    AppColors.N20,
    AppColors.P40,
  );
  static const _ColorScheme alert = _ColorScheme(
    AppColors.A50,
    AppColors.N90,
    AppColors.A60,
    AppColors.N90,
  );
  static const _ColorScheme danger = _ColorScheme(
    AppColors.D40,
    AppColors.N00,
    AppColors.D50,
    AppColors.N00,
  );
  static const _ColorScheme tertiary = _ColorScheme(
    AppColors.N00,
    AppColors.P40,
    AppColors.N00,
    AppColors.P60,
  );
  static const _ColorScheme disabled = _ColorScheme(
    AppColors.N20,
    AppColors.N30,
    AppColors.N20,
    AppColors.N30,
  );

  void chooseScheme(ButtonVariant buttonVariant) {
    switch (buttonVariant) {
      case ButtonVariant.primary:
        scheme = primary;
        break;
      case ButtonVariant.secondary:
        scheme = secondary;
        break;
      case ButtonVariant.alert:
        scheme = alert;
        break;
      case ButtonVariant.danger:
        scheme = danger;
        break;
      case ButtonVariant.tertiary:
        scheme = tertiary;
        break;
      default:
        scheme = primary;
    }
  }

  final ButtonType? type;
  final ButtonVariant variant;
  _ColorScheme scheme = primary;
  final ButtonSize size;
  final Icon? hardwareKey;
  // final kVal;
  final String? label;
  final int? flex;
  final Function onPressed;
  // final Color color;
  // final Color? highlight;
  final Widget? icon;
  final Color borderColor;
  final double borderWidth;
  final BorderRadius? borderRadius;
  final bool? enabled;
  final MainAxisAlignment? textAlignment;
  final String? functionButton;
  final Widget? functionKey;
  final bool? isFlexible;
  // final bool autofocus;
  final double minimalWidth = 160;
  final double maximalWidth = 320; //needs to be implemented

  @override
  Widget build(BuildContext context) {
    chooseScheme(variant);
    if (type == ButtonType.iconText) {
      return Material(
        color: scheme.buttonColor,
        child: InkWell(
          // splashColor: AppColors.HIGHTLIGHT_DEFAULT,
          highlightColor: scheme.highlightColor,
          onTap: () {
            enabled == true ? onPressed() : null;
          },
          child: SizedBox(
            // height: height ?? 56,
            // decoration: BoxDecoration(
            //   color: disabled == null
            //       ? (color ?? Colors.lightBlue[700])
            //       : Colors.grey[400],
            // ),
            child: Padding(
              padding: (size == ButtonSize.large)
                  ? const EdgeInsets.symmetric(
                      vertical: AppSpacing.space4,
                      horizontal: AppSpacing.space6)
                  : const EdgeInsets.symmetric(
                      vertical: AppSpacing.space4,
                      horizontal: AppSpacing.space6),
              child: Row(
                mainAxisAlignment: textAlignment ?? MainAxisAlignment.center,
                children: [
                  (functionKey != null)
                      ? Padding(
                          padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
                          child: functionKey,
                        )
                      : Container(),
                  (functionKey != null)
                      ? const SizedBox(width: AppSpacing.space2)
                      : Container(),
                  Text(
                    label!,
                    style: AppFont.smallMedium(textColor: scheme.textColor),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
    if (type == ButtonType.iconOnly) {
      return ClipRRect(
        // borderRadius: BorderRadius.circular(0),
        child: Material(
          color: scheme.buttonColor,
          child: InkWell(
            // splashColor: highlight,
            highlightColor: scheme.highlightColor,
            onTap: () {
              enabled == true ? onPressed() : null;
            },
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(AppSpacing.space2),
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(0),
              //   border: Border.all(color: borderColor, width: borderWidth),
              // ),
              child:
                  // icon == null
                  // ? Text(
                  //     label!,
                  //     style: AppFont.largeMedium(scheme.textColor),
                  //   )
                  // :
                  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon!,
                  // const SizedBox(height: 10),
                  // Text(
                  //   label!,
                  //   textAlign: TextAlign.center,
                  //   style: AppFont.smallMedium(scheme.textColor),
                  // ),
                  // functionButton == null
                  //     ? Container()
                  //     : Padding(
                  //         padding: const EdgeInsets.only(top: 30),
                  //         child: SvgPicture.asset(functionButton!),
                  //       ),
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      return Button(onPressed: onPressed);
    }
  }
}

class _ColorScheme {
  const _ColorScheme(this.buttonColor, this.textColor, this.highlightColor,
      this.highlightTextColor);

  final Color buttonColor;
  final Color textColor;
  final Color highlightColor;
  final Color highlightTextColor;
}
