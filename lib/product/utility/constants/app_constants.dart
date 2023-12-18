import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract final class AppConstants {
  const AppConstants._();

  static const String appName = 'Movie App';

  static const String genPackageName = 'gen';
  static const String movieBackdropPathUrl =
      'https://image.tmdb.org/t/p/original/';
}
