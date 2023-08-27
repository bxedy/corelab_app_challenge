import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

import '../../core/i18n/i18n.dart';

class AppGlobalKeys {
  static final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  static final globalKey = GlobalKey();
  static final navigatorKey = GlobalKey<NavigatorState>();
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Modular.setNavigatorKey(AppGlobalKeys.navigatorKey);
    LocalJsonLocalization.delegate.directories = I18nConfigs.directories;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        supportedLocales: const [Locale('pt', 'BR')],
        localizationsDelegates: [
          LocalJsonLocalization.delegate,
        ],
        routeInformationParser: Modular.routeInformationParser,
        routerDelegate: Modular.routerDelegate,
        scaffoldMessengerKey: AppGlobalKeys.scaffoldMessengerKey,
        key: AppGlobalKeys.globalKey,
      ),
    );
  }
}
