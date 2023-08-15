import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

/// Defines default colors used in Ontego theme & shadows generators
@immutable
class AppColors {
  static const Color mainColor = Color(0xFF009BCF);
  static const Color greyTextField = Color(0xFFF2F6F7);
  static const Color featureBox = Color(0xFF31AFD8);
  static const Color optionRed = Color(0xFFF1675D);
  static const Color optionGreen = Color(0xFF31AF80);
  static const Color greyContainer = Color(0xFF969696);
  static const Color blueButton = Color(0xFF31AFD8);
  static const Color blueText = Color(0xFF009BD1);
  static const Color greyText = Color(0xFF96999E);
  static const Color standardText = Colors.black;
  static const Color darkGreyText = Color(0xFF838383);
  static const Color whiteText = Colors.white;
  static const Color greyRow = Color.fromARGB(255, 244, 246, 245);
  static const Color greyBottomDivider = Color.fromARGB(255, 202, 203, 205);
  static const Color grayTopDivider = Color.fromARGB(255, 226, 226, 226);
  static const Color greyCheckbox = Color.fromARGB(255, 233, 233, 233);
  static const Color greenTickBox = Color(0xFF019C63);
  static const Color ontegoAlert = Color(0xFFffd235);
  static const Color ontegoAlertDark = Color(0xFFd1b704);
  static const Color ontegoDanger = Color(0xFFf1675e);
  static const Color greenTrafficLight = Color(0xFF41C300);
  static const Color redTrafficLight = Color(0xFFF44236);
  static const Color highlightDefault = Color(0xFF5A8E12);

  static const Color N00 = Color(0xFFFFFFFF);
  static const Color N10 = Color(0xFFF1F1F1);
  static const Color N20 = Color(0xFFE0E0E0);
  static const Color N30 = Color(0xFF9EA1A4);
  static const Color N40 = Color(0xFF7E8286);
  static const Color N50 = Color(0xFF5E6267);
  static const Color N60 = Color(0xFF3E4349);
  static const Color N70 = Color(0xFF34383D);
  static const Color N80 = Color(0xFF292D31);
  static const Color N90 = Color(0xFF1F2225);
  static const Color N100 = Color(0xFF151618);

  static const Color P00 = Color(0xFFD3ECF6);
  static const Color P10 = Color(0xFFB6DFF0);
  static const Color P20 = Color(0xFF92CFE8);
  static const Color P30 = Color(0xFF6EBFE1);
  static const Color P40 = Color(0xFF49AFD9);
  static const Color P50 = Color(0xFF259FD2);
  static const Color P60 = Color(0xFF1F84AF);
  static const Color P70 = Color(0xFF196A8C);
  static const Color P80 = Color(0xFF135069);
  static const Color P90 = Color(0xFF0C3546);
  static const Color P100 = Color(0xFF07202A);

  static const Color SEC00 = Color(0xFFFDE8D7);
  static const Color SEC10 = Color(0xFFFCD9BC);
  static const Color SEC20 = Color(0xFFFAC59A);
  static const Color SEC30 = Color(0xFFF9B279);
  static const Color SEC40 = Color(0xFFF79F58);
  static const Color SEC50 = Color(0xFFF68C36);
  static const Color SEC60 = Color(0xFFCD752D);
  static const Color SEC70 = Color(0xFFA45D24);
  static const Color SEC80 = Color(0xFF7B461B);
  static const Color SEC90 = Color(0xFF522F12);
  static const Color SEC100 = Color(0xFF311C0B);

  static const Color TER00 = Color(0xFFf7E3EE);
  static const Color TER10 = Color(0xFFF1D0E3);
  static const Color TER20 = Color(0xFFEAB9D5);
  static const Color TER30 = Color(0xFFE3A2C8);
  static const Color TER40 = Color(0xFFDC8ABA);
  static const Color TER50 = Color(0xFFD573AC);
  static const Color TER60 = Color(0xFFB1608F);
  static const Color TER70 = Color(0xFF8E4D73);
  static const Color TER80 = Color(0xFF6B3A56);
  static const Color TER90 = Color(0xFF472639);
  static const Color TER100 = Color(0xFF2B1722);

  static const Color S00 = Color(0xFFD2ECE2);
  static const Color S10 = Color(0xFFB4DFCE);
  static const Color S20 = Color(0xFF8ECFB5);
  static const Color S30 = Color(0xFF68C09D);
  static const Color S40 = Color(0xFF43B084);
  static const Color S50 = Color(0xFF1DA06C);
  static const Color S60 = Color(0xFF18855A);
  static const Color S70 = Color(0xFF136B48);
  static const Color S80 = Color(0xFF0F5036);
  static const Color S90 = Color(0xFF0A3524);
  static const Color S100 = Color(0xFF062016);

  static const Color A00 = Color(0xFFFFF4D5);
  static const Color A10 = Color(0xFFFFEDB9);
  static const Color A20 = Color(0xFFFFE496);
  static const Color A30 = Color(0xFFFFDC74);
  static const Color A40 = Color(0xFFFFD351);
  static const Color A50 = Color(0xFFFFCA2E);
  static const Color A60 = Color(0xFFD4A826);
  static const Color A70 = Color(0xFFAA871F);
  static const Color A80 = Color(0xFF806517);
  static const Color A90 = Color(0xFF55430F);
  static const Color A100 = Color(0xFF332809);

  static const Color D00 = Color(0xFFFCDCDA);
  static const Color D10 = Color(0xFFFAC4C1);
  static const Color D20 = Color(0xFFF7A6A2);
  static const Color D30 = Color(0xFFF48984);
  static const Color D40 = Color(0xFFF26C65);
  static const Color D50 = Color(0xFFEF4E46);
  static const Color D60 = Color(0xFFC7413A);
  static const Color D70 = Color(0xFF9F342F);
  static const Color D80 = Color(0xFF78723);
  static const Color D90 = Color(0xFF501A17);
  static const Color D100 = Color(0xFF30100E);

  AppColors._();

  // static Color decorationWhiteColor(Color color, {required double intensity}) {
  //   // intensity act on opacity;
  //   return _applyPercentageOnOpacity(
  //     maxColor: color,
  //     percent: intensity,
  //   );
  // }

  // static Color decorationDarkColor(Color color, {required double intensity}) {
  //   // intensity act on opacity;
  //   return _applyPercentageOnOpacity(
  //     maxColor: color,
  //     percent: intensity,
  //   );
  // }

  // static Color embossWhiteColor(Color color, {required double intensity}) {
  //   // intensity act on opacity;
  //   return _applyPercentageOnOpacity(
  //     maxColor: color,
  //     percent: intensity,
  //   );
  // }

  // static Color embossDarkColor(Color color, {required double intensity}) {
  //   // intensity act on opacity;
  //   return _applyPercentageOnOpacity(
  //     maxColor: color,
  //     percent: intensity,
  //   );
  // }

  // static Color gradientShaderDarkColor({required double intensity}) {
  //   // intensity act on opacity;
  //   return _applyPercentageOnOpacity(
  //       maxColor: AppColors._gradientShaderDarkColor, percent: intensity);
  // }

  // static Color gradientShaderWhiteColor({required double intensity}) {
  //   // intensity act on opacity;
  //   return _applyPercentageOnOpacity(
  //       maxColor: AppColors._gradientShaderWhiteColor, percent: intensity);
  // }

  // static Color _applyPercentageOnOpacity(
  //     {required Color maxColor, required double percent}) {
  //   final maxOpacity = maxColor.opacity;
  //   // final maxIntensity = Neumorphic.MAX_INTENSITY;
  //   // final newOpacity = percent * maxOpacity / maxIntensity;
  //   // final newColor =
  //   //     maxColor.withOpacity(newOpacity); //<-- intensity act on opacity;
  //   // return newColor;
  // }
}
