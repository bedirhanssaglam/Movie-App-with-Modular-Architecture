import 'package:flutter/material.dart';

/// Project general padding items
final class ProjectPadding extends EdgeInsets {
  const ProjectPadding() : super.all(0);

  /// [ProjectPadding.allMedium] is 16
  const ProjectPadding.allMedium() : super.all(16);

  const ProjectPadding.normalHorizontal() : super.symmetric(horizontal: 20);

  const ProjectPadding.smallVertical() : super.symmetric(vertical: 4);

  const ProjectPadding.leftSmall() : super.only(left: 20);

  const ProjectPadding.mediumVerticalAndHorizontal()
      : super.symmetric(horizontal: 20, vertical: 20);
}
