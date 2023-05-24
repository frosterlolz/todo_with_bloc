import 'package:todo_with_bloc/src/core/utils/log_history_strategy.dart';

class LocalLogger {
  static final _strategies = <Type, LogStrategy>{};

  /// Debug.
  static void d(String msg, [Exception? error]) {
    _forAllStrategies(
      (strategy) => strategy.log(msg, priorityLogDebug, error),
    );
  }

  /// Warn (for expected errors).
  static void w(String msg, [Exception? error]) {
    _forAllStrategies(
      (strategy) => strategy.log(msg, priorityLogWarn, error),
    );
  }

  /// Error (for errors).
  static void e(String msg, [Exception? error]) {
    _forAllStrategies(
      (strategy) => strategy.log(msg, priorityLogError, error),
    );
  }

  /// Add new strategy.
  static void addStrategy(LogStrategy strategy) {
    _strategies[strategy.runtimeType] = strategy;
  }

  /// Remove all strategies.
  static void removeStrategy(LogStrategy strategy) {
    _strategies.remove(strategy.runtimeType);
  }

  static void _forAllStrategies(void Function(LogStrategy) action) {
    _strategies.values.forEach(action);
  }
}

/// Set of constants for the logger.

/// Priority for debug.
const priorityLogDebug = 1;

/// Priority for warn (for expected errors).
const priorityLogWarn = 2;

/// Priority for error.
const priorityLogError = 3;

/// Prefix for  debug.
const prefixLogDebug = 'DEBUG_INFO';

/// Prefix for warn (expected errors).
const prefixLogWarn = 'DEBUG_WARN';

/// Prefix for error.
const prefixLogError = 'DEBUG_ERROR';
