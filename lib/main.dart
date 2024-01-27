import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'config/http_overrides.dart';
import 'config/instance_config.dart';
import 'config/ui_config.dart';
import 'controllers/auth_controller.dart';
import 'controllers/theme_controller.dart';
import 'events/bus_events.dart';
import 'network/config/http_config.dart';
import 'router/app_router.dart';
import 'storage/storage.dart';
import 'ui/resources/themes/themes.dart';
import 'ui/resources/themes/themes_night.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  HttpOverrides.global = AppHttpOverrides();

  await AppStorage.storageConfig();
  ThemeController().init();
  await httpConfig();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('ar', 'SY'), Locale('en', 'US')],
      startLocale: const Locale('ar', 'SY'),
      path: 'assets/localization',
      fallbackLocale: const Locale('ar', 'SY'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    // change Material-App current theme
    eventBus.on<ThemeChangedEvent>().listen((_) => setState(() {}));

    // set application on-launch UI configuration
    WidgetsBinding.instance.addPostFrameCallback((_) => uiConfig(context));

    // hide soft keyboard when (non-context class) emit event
    eventBus.on<SoftKeyboardEvent>().listen((_) => hideSoftKeyboard(context));

    // handle unauthorizedEvent
    eventBus.on<UnauthorizedEvent>().listen((_) => _handleUnauthorizedEvent());
  }

  /// logOut
  void _handleUnauthorizedEvent() async {
    await AuthenticationController.logOut();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => hideSoftKeyboard(context),
      child: MaterialApp.router(
        routerDelegate: appRouter.delegate(),
        routeInformationParser: appRouter.defaultRouteParser(),
        title: 'ندرس: تطبيق الأهل',
        themeMode: findInstance<ThemeController>().themeMode.value,
        theme: lightTheme,
        darkTheme: darkTheme,
        locale: context.locale,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
