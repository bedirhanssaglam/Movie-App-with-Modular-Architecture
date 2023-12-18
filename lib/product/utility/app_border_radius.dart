import 'package:flutter/material.dart';

/// Project general border radius items
final class AppBorderRadius extends BorderRadius {
  AppBorderRadius() : super.circular(0);

  AppBorderRadius.circularSmall() : super.circular(8);

  /// [AppBorderRadius.circularMedium] is 20
  AppBorderRadius.circularMedium() : super.circular(20);
}
