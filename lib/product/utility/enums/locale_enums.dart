import 'package:flutter/material.dart';

/// Project locale enum for operation and configuration
enum Locales {
  /// Turkish locale
  tr(Locale('tr', 'TR')),

  /// English locale
  en(Locale('en', 'US'));

  const Locales(this.locale);

  /// Locale value
  final Locale locale;
}
