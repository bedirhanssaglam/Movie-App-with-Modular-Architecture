import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviemodular/product/state/view_model/product_view_model.dart';

extension ContextExtensions on BuildContext {
  ThemeData get themeData => Theme.of(this);

  TextTheme get textTheme => themeData.textTheme;
  ColorScheme get colorScheme => themeData.colorScheme;

  Size get size => MediaQuery.sizeOf(this);

  double get screenHeight => size.height;
  double get screenWidth => size.width;

  bool get isDarkMode => select<ProductViewModel, bool>(
        (ProductViewModel viewModel) =>
            viewModel.state.themeMode == ThemeMode.dark,
      );
}
