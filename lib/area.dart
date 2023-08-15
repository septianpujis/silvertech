import "package:flutter/material.dart";

import '../constants/colors.dart';

class Area extends StatelessWidget {
  const Area(
      {Key? key,
      this.width,
      this.height,
      this.color,
      this.padding,
      this.margin,
      this.decoration,
      required this.light,
      this.child})
      : super(key: key);

  final double? width;
  final double? height;
  final Color? color;
  final EdgeInsets? padding;
  final EdgeInsetsGeometry? margin;
  final Decoration? decoration;
  final bool light;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: light ? AppColors.N00 : AppColors.N20,
      padding: padding,
      margin: margin,
      decoration: decoration,
      child: child,
    );
  }
}
