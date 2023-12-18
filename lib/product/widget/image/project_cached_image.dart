import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:moviemodular/product/utility/app_border_radius.dart';
import 'package:moviemodular/product/utility/extensions/asset_extensions.dart';

/// Network cached image with [Lottie] Loading
final class ProjectCachedImage extends StatelessWidget {
  const ProjectCachedImage({required this.url, super.key});
  final String? url;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: AppBorderRadius.circularMedium(),
      child: CustomCachedImage(
        imageUrl: url,
        loadingWidget: Center(
          child: Assets.lottie.loading.lottieBuilder(),
        ),
      ),
    );
  }
}
