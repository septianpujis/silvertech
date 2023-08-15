import 'package:flutter/material.dart';
import 'colors.dart';

// Defines default colors used in Ontego theme & shadows generators
// @immutable
class AppFont {
  static TextStyle xxlBold({Color? textColor}) => TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      fontSize: 24,
      // height: 36,
      letterSpacing: 0.005);
  static TextStyle xxlRegular({Color? textColor}) => TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      fontSize: 24,
      // height: 36,
      letterSpacing: 0.005);

  static TextStyle xlMedium({Color? textColor}) => TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      fontSize: 20,
      // height: 26,
      letterSpacing: 0.005);

  static TextStyle largeMedium({Color? textColor}) => TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      fontSize: 18,
      // height: 24,
      letterSpacing: 0.005);

  static TextStyle mediumSemibold({Color? textColor}) => TextStyle(
        // // color: AppColors.N100,
        color: textColor ?? AppColors.N100,
        fontFamily: 'Roboto',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        fontSize: 16,
        // height: 22
      );
  static TextStyle mediumMedium({Color? textColor}) => TextStyle(
        // // color: AppColors.N100,
        color: textColor ?? AppColors.N100,
        fontFamily: 'Roboto',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        fontSize: 16,
        // height: 22
      );
  static TextStyle mediumRegular({Color? textColor}) => TextStyle(
        // // color: AppColors.N100,
        color: textColor ?? AppColors.N100,
        fontFamily: 'Roboto',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: 16,
        // height: 22
      );

  static TextStyle smallBold({Color? textColor}) => TextStyle(
        // // color: AppColors.N100,
        color: textColor ?? AppColors.N100,
        fontFamily: 'Roboto',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700,
        fontSize: 14,
        // height: 20
      );
  static TextStyle smallSemibold({Color? textColor}) => TextStyle(
        // // color: AppColors.N100,
        color: textColor ?? AppColors.N100,
        fontFamily: 'Roboto',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        fontSize: 14,
        // height: 20
      );
  static TextStyle smallMedium({Color? textColor}) => TextStyle(
        // // color: AppColors.N100,
        color: textColor ?? AppColors.N100,
        fontFamily: 'Roboto',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        fontSize: 14,
        // height: 20
      );
  static TextStyle smallRegular({Color? textColor}) => TextStyle(
        // // color: AppColors.N100,
        color: textColor ?? AppColors.N100,
        fontFamily: 'Roboto',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: 14,
        // height: 20
      );

  static TextStyle xsBold({Color? textColor}) => TextStyle(
        // // color: AppColors.N100,
        color: textColor ?? AppColors.N100,
        fontFamily: 'Roboto',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700,
        fontSize: 12,
        // height: 16
      );
  static TextStyle xsSemibold({Color? textColor}) => TextStyle(
        // // color: AppColors.N100,
        color: textColor ?? AppColors.N100,
        fontFamily: 'Roboto',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        fontSize: 12,
        // height: 16
      );
  static TextStyle xsMedium({Color? textColor}) => TextStyle(
        // // color: AppColors.N100,
        color: textColor ?? AppColors.N100,
        fontFamily: 'Roboto',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        fontSize: 12,
        // height: 16
      );
  static TextStyle xsRegular({Color? textColor}) => TextStyle(
        // // color: AppColors.N100,
        color: textColor ?? AppColors.N100,
        fontFamily: 'Roboto',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: 12,
        // height: 16
      );

  static TextStyle xxsMedium({Color? textColor}) => TextStyle(
        // // color: AppColors.N100,
        color: textColor ?? AppColors.N100,
        fontFamily: 'Roboto',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700,
        fontSize: 10,
        // height: 14
      );
  static TextStyle xxsRegular({Color? textColor}) => TextStyle(
        // // color: AppColors.N100,
        color: textColor ?? AppColors.N100,
        fontFamily: 'Roboto',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700,
        fontSize: 10,
        // height: 14
      );

  /*static TextStyle h1Bold({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      fontSize: 24,
      // height: 36,
      letterSpacing: 0.012);
  static TextStyle h1Semibold({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      fontSize: 24,
      // height: 36,
      letterSpacing: 0.012);
  static TextStyle h1Medium({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      fontSize: 24,
      // height: 36,
      letterSpacing: 0.012);
  static TextStyle h1Regular({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      fontSize: 24,
      // height: 36,
      letterSpacing: 0.012);

  static TextStyle h2Bold({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      fontSize: 20,
      // height: 26,
      letterSpacing: 0.012);
  static TextStyle h2Semibold({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      fontSize: 20,
      // height: 26,
      letterSpacing: 0.012);
  static TextStyle h2Medium({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      fontSize: 20,
      // height: 26,
      letterSpacing: 0.012);
  static TextStyle h2Regular({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      fontSize: 20,
      // height: 26,
      letterSpacing: 0.012);

  static TextStyle h3Bold({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      fontSize: 18,
      // height: 24,
      letterSpacing: 0.012);
  static TextStyle h3Semibold({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      fontSize: 18,
      // height: 24,
      letterSpacing: 0.012);
  static TextStyle h3Medium({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      fontSize: 18,
      // height: 24,
      letterSpacing: 0.012);
  static TextStyle h3Regular({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      fontSize: 18,
      // height: 24,
      letterSpacing: 0.012);

  static TextStyle h4Bold({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      fontSize: 16,
      height: 22,
      letterSpacing: 0.012);
  static TextStyle h4Semibold({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      fontSize: 16,
      height: 22,
      letterSpacing: 0.012);
  static TextStyle h4Medium({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      fontSize: 16,
      height: 22,
      letterSpacing: 0.012);
  static TextStyle h4Regular({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      fontSize: 16,
      height: 22,
      letterSpacing: 0.012);

  static TextStyle h5Bold({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      fontSize: 14,
      // height: 20,
      letterSpacing: 0.012);
  static TextStyle h5Semibold({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      fontSize: 14,
      // height: 20,
      letterSpacing: 0.012);
  static TextStyle h5Medium({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      fontSize: 14,
      // height: 20,
      letterSpacing: 0.012);
  static TextStyle h5Regular({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      fontSize: 14,
      // height: 20,
      letterSpacing: 0.012);

  static TextStyle h6Bold({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      fontSize: 12,
      // height: 16,
      letterSpacing: 0.012);
  static TextStyle h6Semibold({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      fontSize: 12,
      // height: 16,
      letterSpacing: 0.012);
  static TextStyle h6Medium({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      fontSize: 12,
      // height: 16,
      letterSpacing: 0.012);
  static TextStyle h6Regular({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      fontSize: 12,
      // height: 16,
      letterSpacing: 0.012);

  static TextStyle h7Bold({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      fontSize: 11,
      // height: 15,
      letterSpacing: 0.012);
  static TextStyle h7Semibold({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      fontSize: 11,
      // height: 15,
      letterSpacing: 0.012);
  static TextStyle h7Medium({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      fontSize: 11,
      // height: 15,
      letterSpacing: 0.012);
  static TextStyle h7Regular({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      fontSize: 11,
      // height: 15,
      letterSpacing: 0.012);

  static TextStyle b1Bold({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      fontSize: 16,
      // height: 2,
      letterSpacing: 0.012);
  static TextStyle b1Semibold({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      fontSize: 16,
      height: 22,
      letterSpacing: 0.012);
  static TextStyle b1Medium({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      fontSize: 16,
      // height: 22,
      letterSpacing: 0.012);
  static TextStyle b1Regular({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      fontSize: 16,
      // height: 22,
      letterSpacing: 0.012);
  static TextStyle b1Light({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w300,
      fontSize: 16,
      // height: 22,
      letterSpacing: 0.012);
  static TextStyle b1RegularItalic({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w400,
      fontSize: 16,
      // height: 22,
      letterSpacing: 0.012);

  static TextStyle b2Bold({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      fontSize: 14,
      // height: 20,
      letterSpacing: 0.012);
  static TextStyle b2Semibold({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      fontSize: 14,
      // height: 20,
      letterSpacing: 0.012);
  static TextStyle b2Medium({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      fontSize: 14,
      // height: 20,
      letterSpacing: 0.012);
  static TextStyle b2Regular({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      fontSize: 14,
      // height: 20,
      letterSpacing: 0.012);
  static TextStyle b2Light({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w300,
      fontSize: 14,
      // height: 20,
      letterSpacing: 0.012);
  static TextStyle b2RegularItalic({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w400,
      fontSize: 14,
      // height: 20,
      letterSpacing: 0.012);

  static TextStyle b3Bold({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      fontSize: 12,
      // height: 16,
      letterSpacing: 0.012);
  static TextStyle b3Semibold({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      fontSize: 12,
      // height: 16,
      letterSpacing: 0.012);
  static TextStyle b3Medium({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      fontSize: 12,
      // height: 16,
      letterSpacing: 0.012);
  static TextStyle b3Regular({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      fontSize: 12,
      // height: 16,
      letterSpacing: 0.012);
  static TextStyle b3Light({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w300,
      fontSize: 12,
      // height: 16,
      letterSpacing: 0.012);
  static TextStyle b3RegularItalic({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w400,
      fontSize: 12,
      // height: 16,
      letterSpacing: 0.012);

  static TextStyle b4Bold({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      fontSize: 10,
      // height: 14,
      letterSpacing: 0.012);
  static TextStyle b4Semibold({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      fontSize: 10,
      // height: 14,
      letterSpacing: 0.012);
  static TextStyle b4Medium({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      fontSize: 10,
      // height: 14,
      letterSpacing: 0.012);
  static TextStyle b4Regular({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      fontSize: 10,
      // height: 14,
      letterSpacing: 0.012);
  static TextStyle b4Light({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w300,
      fontSize: 10,
      // height: 14,
      letterSpacing: 0.012);
  static TextStyle b4RegularItalic({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w400,
      fontSize: 10,
      // height: 14,
      letterSpacing: 0.012);

  static TextStyle b5Bold({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      fontSize: 8,
      // height: 11,
      letterSpacing: 0.012);
  static TextStyle b5Semibold({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      fontSize: 8,
      // height: 11,
      letterSpacing: 0.012);
  static TextStyle b5Medium({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      fontSize: 8,
      // height: 11,
      letterSpacing: 0.012);
  static TextStyle b5Regular({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      fontSize: 8,
      // height: 11,
      letterSpacing: 0.012);
  static TextStyle b5Light({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w300,
      fontSize: 8,
      // height: 11,
      letterSpacing: 0.012);
  static TextStyle b5RegularItalic({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w400,
      fontSize: 8,
      // height: 11,
      letterSpacing: 0.012);

  static TextStyle l1Medium({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w500,
      fontSize: 16,
      height: 22,
      letterSpacing: 0.012);
  static TextStyle l1Regular({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w400,
      fontSize: 16,
      height: 22,
      letterSpacing: 0.012);

  static TextStyle l2Medium({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w500,
      fontSize: 14,
      // height: 20,
      letterSpacing: 0.012);
  static TextStyle l2Regular({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w400,
      fontSize: 14,
      // height: 20,
      letterSpacing: 0.012);

  static TextStyle l3Medium({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w500,
      fontSize: 12,
      // height: 16,
      letterSpacing: 0.012);
  static TextStyle l3Regular({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w400,
      fontSize: 12,
      // height: 16,
      letterSpacing: 0.012);

  static TextStyle l4Medium({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w500,
      fontSize: 10,
      // height: 14,
      letterSpacing: 0.012);
  static TextStyle l4Regular({Color? textColor}) = TextStyle(
      // // color: AppColors.N100,
      color: textColor ?? AppColors.N100,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w400,
      fontSize: 10,
      // height: 14,
      letterSpacing: 0.012);*/

  AppFont._();
}
