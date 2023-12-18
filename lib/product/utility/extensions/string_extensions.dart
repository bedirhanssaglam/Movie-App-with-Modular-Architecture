import 'package:easy_localization/easy_localization.dart';
import 'package:moviemodular/product/utility/constants/app_constants.dart';

extension LocalizationExtension on String {
  String get localize => this.tr();
  String localizeWithArgs(List<String> args) => this.tr(args: args);
}

extension NetworkImagePathExtension on String? {
  String get toMovieImage => '${AppConstants.movieBackdropPathUrl}$this';
}
