import 'package:carousel_slider/carousel_slider.dart';
import 'package:common/src/package/carousel_slider/carousel_slider_size.dart';
import 'package:flutter/material.dart';

typedef CarouselWidgetBuilder = Widget Function(int index);

final class CarouselSliderBuilder extends StatelessWidget {
  const CarouselSliderBuilder({
    required this.widgetBuilder,
    required this.itemCount,
    super.key,
    this.enlargeCenterPage,
    this.carouselSliderSize = const CarouselSliderSize(),
    this.autoPlay = false,
    this.disableCenter = true,
  });

  final int itemCount;
  final CarouselWidgetBuilder widgetBuilder;
  final CarouselSliderSize carouselSliderSize;
  final bool autoPlay;
  final bool disableCenter;
  final bool? enlargeCenterPage;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        enlargeCenterPage: enlargeCenterPage,
        disableCenter: disableCenter,
        scrollPhysics: const BouncingScrollPhysics(),
        aspectRatio: carouselSliderSize.aspectRatio,
        viewportFraction: carouselSliderSize.viewportFraction,
      ),
      itemCount: itemCount,
      itemBuilder: (context, index, _) => widgetBuilder(index),
    );
  }
}
