import 'package:cached_network_image/cached_network_image.dart';
import 'package:common/src/package/cached_image/custom_mem_cache.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// It will provide to image caching and image loading from network
final class CustomCachedImage extends StatelessWidget {
  /// The line `const CustomCachedImage({super.key});` is defining
  /// a constructor for the `CustomCachedImage` class.
  const CustomCachedImage({
    super.key,
    this.imageUrl,
    this.emptyWidget,
    this.memCache = const CustomMemCache(),
    this.boxFit = BoxFit.cover,
    this.loadingWidget,
    this.size,
  });

  /// Image source address
  final String? imageUrl;

  /// When image is not available then it will show empty widget
  final Widget? emptyWidget;

  /// When image is loading then it will show loading widget
  final Widget? loadingWidget;

  /// Default value is [CustomMemCache(height: 200, width: 300)]
  final CustomMemCache memCache;

  /// Default value is [BoxFit.cover]
  final BoxFit boxFit;

  /// Image size
  final Size? size;

  @override
  Widget build(BuildContext context) {
    final url = imageUrl;
    if (url == null || url.isEmpty) {
      return emptyWidget ?? const Icon(Icons.error);
    }
    return CachedNetworkImage(
      imageUrl: url,
      memCacheHeight: memCache.height,
      memCacheWidth: memCache.width,
      fit: boxFit,
      width: size?.width,
      height: size?.height,
      errorListener: (value) {
        if (kDebugMode) debugPrint('Error: $value');
      },
      progressIndicatorBuilder: (context, _, __) {
        return loadingWidget ??
            const Center(
              child: CircularProgressIndicator.adaptive(),
            );
      },
      errorWidget: (context, _, __) {
        return emptyWidget ?? const Icon(Icons.error);
      },
    );
  }
}
