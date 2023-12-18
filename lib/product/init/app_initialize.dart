import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:easy_logger/easy_logger.dart';
import 'package:flutter/material.dart'
    show FlutterError, WidgetsFlutterBinding, immutable;
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:moviemodular/product/init/config/app_environment.dart';
import 'package:moviemodular/product/state/container/product_state_container.dart';

@immutable

/// This class is used to initialize the application process
final class ApplicationInitialize {
  /// Project basic required initialize
  Future<void> make() async {
    WidgetsFlutterBinding.ensureInitialized();

    await runZonedGuarded<Future<void>>(
      _initialize,
      (error, stack) {
        Logger().e(error);
      },
    );
  }

  /// This method is used to initialize the application process
  Future<void> _initialize() async {
    await _configureApplication();

    FlutterError.onError = (details) {
      Logger().e(details.exceptionAsString());
    };

    _initializeProductEnvironmentWithContainer();
  }

  Future<void> _configureApplication() async {
    await EasyLocalization.ensureInitialized();
    EasyLocalization.logger.enableLevels = [LevelMessages.error];
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  /// DO NOT CHANGE THIS METHOD
  void _initializeProductEnvironmentWithContainer() {
    AppEnvironment.general();

    /// It must be called after [AppEnvironment.general()]
    ProductContainer.setup();
  }
}
