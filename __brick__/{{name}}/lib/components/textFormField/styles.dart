import 'package:flutter/material.dart';
import 'package:{{name.lowerCase()}}/constants/index.dart';

class Styles {
  Styles._();

  static TextStyle hintStyle(BuildContext context) {
    return const TextStyle(
      color: Colors.grey,
      fontFamily: Fonts.roboto,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle errorStyle(BuildContext context) {
    return TextStyle(
        fontFamily: Fonts.roboto,
        color: Colors.red,
        fontSize: Metrics.getFontSize(
            context,
            (Metrics.isTablet(context) && !Metrics.isPortrait(context))
                ? FontSize.small * 2
                : FontSize.small));
  }

  static OutlineInputBorder borderStyle(BuildContext context) =>
      OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey, width: 0.1),
        borderRadius: BorderRadius.circular(Metrics.doubleButtonRadius),
      );

  static OutlineInputBorder focusedBorder(BuildContext context) {
    return OutlineInputBorder(
        borderSide: BorderSide(color: Theme.of(context).colors.bg, width: 0.1),
        borderRadius: BorderRadius.circular(Metrics.doubleButtonRadius));
  }

  static TextStyle titleText(BuildContext context) {
    return TextStyle(
        color: Colors.grey,
        fontFamily: Fonts.roboto,
        fontWeight: FontWeight.w400,
        fontSize: Metrics.getFontSize(
            context,
            (Metrics.isTablet(context) && !Metrics.isPortrait(context))
                ? 25
                : FontSize.normal));
  }

  static TextStyle subText(BuildContext context) {
    return const TextStyle(color: Colors.red, fontFamily: Fonts.roboto);
  }

  static OutlineInputBorder errorBorder(BuildContext context) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(Metrics.doubleBorderRadius),
        borderSide: const BorderSide(color: Colors.red, width: 0.8));
  }

  static TextStyle inputTextStyle(BuildContext context) => TextStyle(
      fontFamily: Fonts.roboto, color: Theme.of(context).colors.blackColor);
}
