import 'package:flutter/material.dart';
import 'package:moviemodular/product/init/localization/locale_keys.g.dart';
import 'package:moviemodular/product/utility/extensions/string_extensions.dart';

typedef OnItemTapped = void Function(int)?;

final class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({
    required this.pageIndex,
    super.key,
    this.onItemTapped,
  });
  final OnItemTapped onItemTapped;
  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onItemTapped,
      currentIndex: pageIndex,
      items: [
        BottomNavigationBarItem(
          label: LocaleKeys.home_appbar_dialog_title.localize,
          icon: const Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: LocaleKeys.categories_title.localize,
          icon: const Icon(Icons.category),
        ),
        BottomNavigationBarItem(
          label: LocaleKeys.discover_pageName.localize,
          icon: const Icon(Icons.explore),
        ),
        BottomNavigationBarItem(
          label: LocaleKeys.settings_title.localize,
          icon: const Icon(Icons.settings),
        ),
      ],
    );
  }
}
