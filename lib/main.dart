import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviemodular/product/init/app_initialize.dart';
import 'package:moviemodular/product/init/localization/app_localization.dart';
import 'package:moviemodular/product/init/state_initialize.dart';
import 'package:moviemodular/product/init/theme/manager/dark_theme_manager.dart';
import 'package:moviemodular/product/init/theme/manager/light_theme_manager.dart';
import 'package:moviemodular/product/routes/app_router.dart';
import 'package:moviemodular/product/state/view_model/product_view_model.dart';
import 'package:moviemodular/product/utility/constants/app_constants.dart';
import 'package:widgets/widgets.dart';

Future<void> main() async {
  await ApplicationInitialize().make();
  runApp(ProductLocalization(child: const StateInitialize(child: _MyApp())));
}

final class _MyApp extends StatelessWidget {
  const _MyApp();

  static final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return CustomResponsive(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: AppConstants.appName,
        routerConfig: _MyApp._appRouter.config(),
        theme: LightThemeManager().themeData,
        darkTheme: DarkThemeManager().themeData,
        themeMode: context.watch<ProductViewModel>().state.themeMode,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
      ),
    );
  }
}
