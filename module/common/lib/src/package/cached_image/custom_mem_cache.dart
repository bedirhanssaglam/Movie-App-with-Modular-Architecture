/// Custom mem cache for using network image
final class CustomMemCache {
  /// [height] and [width] is used for caching image
  const CustomMemCache({this.height = 200, this.width = 300});

  /// memCacheHeight
  final int height;

  /// memCacheWidth
  final int width;
}
