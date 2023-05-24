import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:todo_with_bloc/generated/l10n.dart';
import 'package:todo_with_bloc/src/core/ui/assets/themes/app_theme.dart';
import 'package:todo_with_bloc/src/features/app/di/app_scope.dart';
import 'package:todo_with_bloc/src/features/common/service/theme/theme_service.dart';
import 'package:todo_with_bloc/src/features/navigation/service/root_route_observer.dart';

class AppView extends StatefulWidget {
  final AppScope appScope;

  const AppView({
    required this.appScope,
    Key? key,
  }) : super(key: key);

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  late IAppScope _scope;
  late IThemeService _themeService;

  @override
  void initState() {
    super.initState();

    _scope = widget.appScope..applicationRebuilder = _rebuildApplication;
    _themeService = _scope.themeService;
  }

  void _rebuildApplication() {
    setState(() {
      _scope = widget.appScope..applicationRebuilder = _rebuildApplication;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _themeService,
      builder: (context, child) => MaterialApp.router(
        /// Localization
        localizationsDelegates: _localizationsDelegates,
        supportedLocales: _localizations,
        locale: const Locale('ru'),
        // locale: const Locale.fromSubtags(languageCode: 'ru_RU'),

        /// Themes
        theme: AppThemeData.light,
        darkTheme: AppThemeData.dark,
        themeMode: _themeService.currentThemeMode,

        /// Navigation
        routerConfig: _scope.router.config(
          navigatorObservers: () => [RootRouteObserver()],
        ),
        // builder: EasyLoading.init(),
        // routerDelegate: _scope.router.delegate(),
        // routeInformationParser: _scope.router.defaultRouteParser(),
      ),
    );
  }
}

// You need to customize for your project.
final _localizations = S.delegate.supportedLocales;

const _localizationsDelegates = <LocalizationsDelegate<dynamic>>[
  S.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
];
