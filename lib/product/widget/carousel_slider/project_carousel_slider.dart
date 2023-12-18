import 'package:common/common.dart';
import 'package:flutter/material.dart';

final class ProjectCarouselSlider extends StatelessWidget {
  const ProjectCarouselSlider({
    required this.widgetBuilder,
    required this.itemCount,
    super.key,
  });

  final Widget Function(int) widgetBuilder;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return CarouselSliderBuilder(
      itemCount: itemCount,
      widgetBuilder: widgetBuilder,
      enlargeCenterPage: true,
    );
  }
}
