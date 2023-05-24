// ignore: prefer-match-file-name
import 'package:todo_with_bloc/src/core/config/app_config.dart';
import 'package:todo_with_bloc/src/core/config/environment/environment.dart';

abstract class Url {
  /// Test url.
  static String get testUrl => 'http://frosterlolz-test.ru/api';

  /// Prod url.
  static String get prodUrl => 'https://frosterlolz-prod.ru/api';

  /// Dev url.
  static String get devUrl => 'https://frosterlolz-dev.ru/api';

  /// Base url.
  static String get baseUrl => Environment<AppConfig>.instance().config.url;
}
