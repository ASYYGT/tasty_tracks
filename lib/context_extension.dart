import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double dynamicWidth(double val) => MediaQuery.of(this).size.width * val;
  double dynamicHeight(double val) => MediaQuery.of(this).size.height * val;
  double get width => MediaQuery.of(this).size.width;
}

extension PaddingExtension on BuildContext {
  EdgeInsets dynamicHorizontalPadding(double val) =>
      EdgeInsets.symmetric(horizontal: dynamicWidth(val));
  EdgeInsets dynamicVerticalPadding(double val) =>
      EdgeInsets.symmetric(vertical: dynamicHeight(val));
  EdgeInsets dynamicAllPadding(double val0, double val1) =>
      EdgeInsets.symmetric(
          vertical: dynamicHeight(val0), horizontal: dynamicWidth(val1));
}

extension BorderRadiusExtension on BuildContext {
  BorderRadius get borderRadiusValue =>
      const BorderRadius.all(Radius.circular(15));
}
