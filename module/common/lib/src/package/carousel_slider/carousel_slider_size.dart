/// Custom carousel slider sizes for using CarouselSliderBuilder
final class CarouselSliderSize {
  /// [aspectRatio] and [viewportFraction] is used for carousel slider
  const CarouselSliderSize({
    this.aspectRatio = 2.9,
    this.viewportFraction = .56,
  });

  /// aspectRatio
  final double aspectRatio;

  /// viewportFraction
  final double viewportFraction;
}
