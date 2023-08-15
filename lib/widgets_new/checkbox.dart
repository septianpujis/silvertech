import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import '../constants/colors.dart';

enum CheckboxType {
  checkbox,
  checkboxWithText,
}

class OntegoCheckbox extends StatelessWidget {
  const OntegoCheckbox({
    Key? key,
    this.kVal,
    this.type = CheckboxType.checkboxWithText,
    this.label,
    this.labelSize = 14,
    this.labelColor = Colors.white,
    this.labelWeight = FontWeight.w400,
    this.flex,
    this.deviceWidth,
    this.color = AppColors.greyRow,
    this.highlight = AppColors.highlightDefault,
    this.icon,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0,
    this.borderRadius,
    this.enabled = true,
    this.textAlignment,
    this.functionButton,
    this.functionKey,
    this.isAlert = false,
    this.isFlexible = false,
    this.autofocus = false,
    required this.onPressed,
  }) : super(key: key);

  final CheckboxType type;
  final kVal;
  final String? label;
  final double labelSize;
  final FontWeight labelWeight;
  final int? flex;
  final double? deviceWidth;
  final Function onPressed;
  final Color color;
  final Color? highlight;
  final Widget? icon;
  final Color borderColor;
  final Color labelColor;
  final double borderWidth;
  final BorderRadius? borderRadius;
  final bool? enabled;
  final MainAxisAlignment? textAlignment;
  final String? functionButton;
  final Widget? functionKey;
  final bool? isAlert;
  final bool? isFlexible;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    if (type == CheckboxType.checkboxWithText) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: color,
            ),
            width: deviceWidth! * 0.65,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: deviceWidth! * 0.15, child: functionKey),
                SizedBox(
                  width: deviceWidth! * 0.50,
                  child: CheckboxListTile(
                    // tileColor: Color(0xFFececec),
                    controlAffinity: ListTileControlAffinity.platform, //
                    contentPadding: const EdgeInsets.only(right: 10),
                    // isThreeLine: true,
                    title: Text(
                      label!,
                      style: TextStyle(
                        fontSize: labelSize,
                      ),
                    ),
                    value: kVal,
                    // onChanged: (bool? value) => {
                    //       handleChangeSuspect(value),
                    //     }),
                    onChanged: onPressed(),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else if (type == CheckboxType.checkbox) {
      return SizedBox(
        width: deviceWidth! * 0.50,
        child: CheckboxListTile(
          // tileColor: Color(0xFFececec),
          controlAffinity: ListTileControlAffinity.platform, //
          contentPadding: const EdgeInsets.only(right: 10),
          // isThreeLine: true,
          value: kVal,
          // onChanged: (bool? value) => {
          //       handleChangeSuspect(value),
          //     }),
          onChanged: onPressed(),
        ),
      );
    } else {
      return CheckboxListTile(value: kVal, onChanged: onPressed());
    }
  }
}
