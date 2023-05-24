import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_with_bloc/src/core/bloc/app_bloc_observer.dart';
import 'package:todo_with_bloc/src/core/config/app_config.dart';
import 'package:todo_with_bloc/src/core/config/environment/environment.dart';
import 'package:todo_with_bloc/src/core/domain/persistence/storage/theme_storage/theme_storage.dart';
import 'package:todo_with_bloc/src/core/domain/persistence/storage/theme_storage/theme_storage_impl.dart';
import 'package:todo_with_bloc/src/core/utils/error_handlers/default_error_handler.dart';
import 'package:todo_with_bloc/src/core/utils/error_handlers/error_handler.dart';
import 'package:todo_with_bloc/src/features/common/service/theme/theme_service.dart';
import 'package:todo_with_bloc/src/features/common/service/theme/theme_service_impl.dart';
import 'package:todo_with_bloc/src/features/navigation/service/router.dart';

/// Scope of dependencies which need through all app's life.
class AppScope implements IAppScope {
  // TODO(fix): fix if I add full theme (dark)
  static const _themeByDefault = ThemeMode.light;

  late final Dio _dio;
  late final ErrorHandler _errorHandler;
  late final AppRouter _router;
  late final IThemeService _themeService;

  @override
  late VoidCallback applicationRebuilder;

  @override
  Dio get dio => _dio;

  @override
  ErrorHandler get errorHandler => _errorHandler;

  @override
  AppRouter get router => _router;

  @override
  IThemeService get themeService => _themeService;

  late IThemeModeStorage _themeModeStorage;

  AppScope() {
    final additionalInterceptors = <Interceptor>[];
    _dio = _initDio(additionalInterceptors);
    _errorHandler = DefaultErrorHandler();
    _router = AppRouter.instance();
    _themeModeStorage = ThemeModeStorageImpl();
    Bloc.observer = AppBlocObserver.instance();
    Bloc.transformer = sequential<Object?>();
  }

  @override
  Future<void> initTheme() async {
    final theme =
        await ThemeModeStorageImpl().getThemeMode() ?? _themeByDefault;
    _themeService = ThemeServiceImpl(theme);
    _themeService.addListener(_onThemeModeChanged);
  }

  Dio _initDio(Iterable<Interceptor> additionalInterceptors) {
    const timeout = Duration(seconds: 30);

    final dio = Dio();

    dio.options
      ..baseUrl = Environment<AppConfig>.instance().config.url
      ..headers = <String, dynamic>{'Content-Type': 'application/json'}
      ..connectTimeout = timeout
      ..receiveTimeout = timeout
      ..sendTimeout = timeout;

    (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (client) {
      final proxyUrl = Environment<AppConfig>.instance().config.proxyUrl;
      if (proxyUrl != null && proxyUrl.isNotEmpty) {
        client
          ..findProxy = (uri) {
            return 'PROXY $proxyUrl';
          }
          ..badCertificateCallback = (_, __, ___) {
            return true;
          };
      }

      return client;
    };

    dio.interceptors.addAll(additionalInterceptors);

    if (Environment<AppConfig>.instance().isDebug) {
      // dio.interceptors.add(
      // LogInterceptor(requestBody: false, responseBody: false, error: false),
      // );
    }

    return dio;
  }

  Future<void> _onThemeModeChanged() async {
    await _themeModeStorage.saveThemeMode(mode: _themeService.currentThemeMode);
  }
}

/// App dependencies.
abstract class IAppScope {
  /// Http client.
  Dio get dio;

  /// Interface for handle error in business logic.
  ErrorHandler get errorHandler;

  /// Callback to rebuild the whole application.
  VoidCallback get applicationRebuilder;

  /// Class that coordinates navigation for the whole app.
  AppRouter get router;

  /// A service that stores and retrieves app theme mode.
  IThemeService get themeService;

  /// Init theme service with theme from storage or default value
  Future<void> initTheme();
}
