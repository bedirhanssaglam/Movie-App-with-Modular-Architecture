import 'package:flutter/material.dart';
import 'package:moviemodular/product/utility/extensions/string_extensions.dart';

final class LocalizeText extends Text {
  LocalizeText(
    this.text, {
    this.textStyle,
    this.args,
    super.key,
  }) : super(
          args != null ? text.localizeWithArgs(args) : text.localize,
          style: textStyle,
        );

  final String text;
  final TextStyle? textStyle;
  final List<String>? args;
}
