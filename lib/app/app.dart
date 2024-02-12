import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '/presentation/resources/routes_manager.dart';
import '../presentation/resources/theme_manager.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        debugShowCheckedModeBanner: false,
        theme: getAppTheme(),
        darkTheme: getAppDarkTheme(),
        themeMode: ThemeMode.system,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.splashRoute,
    );
  }
}