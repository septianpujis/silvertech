import "package:flutter/material.dart";
import '../constants/icons.dart';
import '../constants/spacing.dart';
import '../constants/colors.dart';
import '../constants/font.dart';

enum DataType {
  mainList,
  subList,
  withIcon,
}

class ListData extends StatelessWidget {
  /// Displays a detail field in a form of data key - supporting text - value
  const ListData({
    Key? key,
    required this.labelKey,
    required this.labelValue,
    this.icon = AppIcons.info,
    this.iconColor = AppColors.P50,
    this.hasIcon = false,
    this.supportingText,
    this.hasSupportingText = true,
    this.isBold = false,
    this.isAlignRight = false,
    this.maxWidth,
    this.color,
    this.isEven = true,
    this.isCompact = false,
    this.hasPadding = true,
  })  : valueWidget = null,
        super(key: key);

  /// Use [ListData.customValue] instead of [ListData] constructor when you wish to
  /// display your own widget (e.g. [RichText])
  const ListData.customValue({
    Key? key,
    required this.labelKey,
    required this.valueWidget,
    this.icon,
    this.iconColor,
    this.hasIcon = false,
    this.supportingText,
    this.hasSupportingText = true,
    this.color,
    this.maxWidth,
    this.isEven = true,
    this.isBold = false,
    this.isAlignRight = false,
    this.isCompact = false,
    this.hasPadding = true,
  })  : labelValue = "",
        assert(valueWidget != null),
        super(key: key);

  /// The value to be displayed as a [Text]
  ///
  /// To display non-[Text] value, see: [Data.customValue]
  final IconData? icon;
  final Color? iconColor;
  final bool? hasIcon;
  final String? supportingText;
  final bool? hasSupportingText;
  final String labelValue;
  final String labelKey;
  final bool isBold;
  final bool isAlignRight;
  final Color? color;
  final bool? maxWidth;
  final bool? isEven;
  final bool isCompact;
  final bool hasPadding;
  final Widget? valueWidget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 28,
      child: Padding(
        padding: !hasPadding
            ? const EdgeInsets.all(0)
            : const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Container(
          decoration: BoxDecoration(
            color: isEven! ? Colors.transparent : AppColors.N20,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.space3,
              vertical: isCompact ? 2.5 : AppSpacing.space2,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      // height: AppSpacing.space2,
                      width: maxWidth == true ? null : 90,
                      child: Text(labelKey,
                          style: isBold
                              ? AppFont.smallBold(textColor: AppColors.N40)
                              : AppFont.smallRegular(textColor: AppColors.N40)),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          // height: AppSpacing.space2,
                          child: valueWidget ??
                              Text(
                                labelValue,
                                style: AppFont.smallRegular(
                                    textColor: AppColors.N90),
                                // textAlign: isAlignRight
                                //     ? TextAlign.right
                                //     : TextAlign.start,
                              ),
                        ),
                        (hasIcon!)
                            ? const SizedBox(
                                width: AppSpacing.space2,
                              )
                            : Container(),
                        (hasIcon!)
                            ? SizedBox(
                                child: Icon(
                                  icon,
                                  color: iconColor,
                                ),
                              )
                            : Container(),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: AppSpacing.space1,
                ),
                hasSupportingText!
                    ? SizedBox(
                        // height: AppSpacing.space2,
                        child: Text(
                          supportingText!,
                          style: AppFont.smallRegular(textColor: AppColors.N90),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ImportantData extends StatelessWidget {
  /// Displays a detail field in a form of data key - supporting text - value
  const ImportantData({
    Key? key,
    required this.labelKey,
    required this.labelValue,
    this.isBold = false,
    this.isAlignRight = false,
    this.maxWidth,
    this.color,
    this.isEven = true,
    this.isCompact = false,
    this.hasPadding = true,
  })  : valueWidget = null,
        super(key: key);

  /// Use [ImportantData.customValue] instead of [ImportantData] constructor when you wish to
  /// display your own widget (e.g. [RichText])
  const ImportantData.customValue({
    Key? key,
    required this.labelKey,
    required this.valueWidget,
    this.color,
    this.maxWidth,
    this.isEven = true,
    this.isBold = false,
    this.isAlignRight = false,
    this.isCompact = false,
    this.hasPadding = true,
  })  : labelValue = "",
        assert(valueWidget != null),
        super(key: key);

  final String labelKey;

  /// The value to be displayed as a [Text]
  ///
  /// To display non-[Text] value, see: [Data.customValue]
  final String labelValue;
  final bool isBold;
  final bool isAlignRight;
  final Color? color;
  final bool? maxWidth;
  final bool? isEven;
  final bool isCompact;
  final bool hasPadding;
  final Widget? valueWidget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 28,
      child: Padding(
        padding: !hasPadding
            ? const EdgeInsets.all(0)
            : const EdgeInsets.fromLTRB(16, 0, 16, 0),
        // padding: const EdgeInsets.all(0),
        child: Container(
          decoration: BoxDecoration(
            color: isEven! ? Colors.transparent : AppColors.N20,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.space3,
              vertical: isCompact ? 2.5 : AppSpacing.space2,
            ),
            child: Column(
              crossAxisAlignment: isAlignRight
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                labelKey.isNotEmpty
                    ? SizedBox(
                        // height: AppSpacing.space2,
                        width: maxWidth == true ? null : 90,
                        child: Text(labelKey,
                            style: isBold
                                ? AppFont.smallBold(textColor: AppColors.N40)
                                : AppFont.smallRegular(
                                    textColor: AppColors.N40),
                            textAlign:
                                isAlignRight ? TextAlign.end : TextAlign.start),
                      )
                    : Container(),
                SizedBox(
                  // height: AppSpacing.space2,
                  child: valueWidget ??
                      Text(
                        labelValue,
                        style: AppFont.smallRegular(textColor: AppColors.N90),
                        textAlign:
                            isAlignRight ? TextAlign.end : TextAlign.start,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
