import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:moviemodular/features/category/view/category_view.dart';
import 'package:moviemodular/features/details/view/details_view.dart';
import 'package:moviemodular/features/discover/view/discover_view.dart';
import 'package:moviemodular/features/home/view/home_view.dart';
import 'package:moviemodular/features/main/view/main_view.dart';
import 'package:moviemodular/features/settings/view/settings_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: AppRouter._replaceRouteName)
final class AppRouter extends _$AppRouter {
  static const String _replaceRouteName = 'View,Route';

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: MainRoute.page,
          initial: true,
          children: [
            AutoRoute(page: HomeRoute.page),
            AutoRoute(page: CategoryRoute.page),
            AutoRoute(page: DiscoverRoute.page),
            AutoRoute(page: SettingsRoute.page),
          ],
        ),
        AutoRoute(page: DetailsRoute.page),
      ];
}
