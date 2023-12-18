import 'package:flutter/material.dart';

final class BottomSheetBase {
  const BottomSheetBase._();

  /// Show a general bottom sheet with
  /// [builder] for the bottom sheet
  static Future<T?> show<T>({
    required BuildContext context,
    required WidgetBuilder builder,
  }) async {
    return showModalBottomSheet<T>(
      context: context,
      builder: builder,
    );
  }
}
