import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:moviemodular/product/utility/enums/locale_enums.dart';

@immutable

/// Product localization manager
final class ProductLocalization extends EasyLocalization {
  /// ProductLocalization need to [child] for a wrap locale item
  ProductLocalization({
    required super.child,
    super.key,
  }) : super(
          supportedLocales: _supportedLocales,
          path: _translationPath,
          useOnlyLangCode: true,
        );

  static final List<Locale> _supportedLocales = [
    Locales.tr.locale,
    Locales.en.locale,
  ];

  static const String _translationPath = 'assets/translations';

  /// Change project language by using [Locales]
  static Future<void> updateLanguage(
    BuildContext context, {
    required Locales value,
  }) async =>
      context.setLocale(value.locale);
}
