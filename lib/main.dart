import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import '/presentation/resources/language_manager.dart';
import 'app/app.dart';
import 'app/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await initAppModule();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(
    EasyLocalization(
      supportedLocales: const [PERSIAN_LOCALE, ENGLISH_LOCALE],
      path: ASSETS_PATH_LOCALIZATION,
      startLocale: PERSIAN_LOCALE,
      child: Phoenix(child: const MyApp()),
    ),
  );
}
