import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:moviemodular/product/routes/app_router.dart';
import 'package:moviemodular/product/widget/bottom_navigation_bar/app_bottom_navigation_bar.dart';

@RoutePage()
final class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.pageView(
      routes: const [
        HomeRoute(),
        CategoryRoute(),
        DiscoverRoute(),
        SettingsRoute(),
      ],
      builder: (context, child, _) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: AppBottomNavigationBar(
            onItemTapped: tabsRouter.setActiveIndex,
            pageIndex: tabsRouter.activeIndex,
          ),
        );
      },
    );
  }
}
