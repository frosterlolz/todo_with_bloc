import 'dart:io';

import 'package:logger/logger.dart';
import 'package:todo_with_bloc/src/core/utils/helpers/local_logger/local_logger.dart';

/// Strategy for log output to file.
/// * used for local debugging with qa environment
class LogHistoryStrategy extends DebugLogStrategy {
  final Logger logger;

  /// Create an instance DebugLogStrategy.
  LogHistoryStrategy(this.logger);
}

/// Writes the log output to a file.
class FileCustomOutput extends LogOutput {
  /// File for write log history.
  final File file;
  IOSink? _sink;

  /// Create an instance [FileCustomOutput].
  FileCustomOutput({required this.file});

  @override
  void init() {
    _sink = file.openWrite(
      mode: FileMode.writeOnlyAppend,
    );
  }

  @override
  void output(OutputEvent event) {
    _sink?.writeln('/// Start \n TimeStamp ${DateTime.now()}');
    _sink?.writeln('${event.level}\n');
    for (final line in event.lines) {
      _sink?.writeln(line);
      _sink?.writeln();
    }
    _sink?.writeln();
    _sink?.writeln('/// End \n');
  }

  @override
  Future<void> destroy() async {
    await _sink?.flush();
    await _sink?.close();
  }
}

class DebugLogStrategy extends LogStrategy {
  final Logger _logger;

  /// Create an instance DebugLogStrategy.
  DebugLogStrategy([Logger? logger])
      : _logger = logger ??= Logger(printer: PrettyPrinter(methodCount: 0));

  @override
  void log(String message, int priority, [Exception? error]) {
    if (error != null) {
      _logger.e(message, error);
    } else {
      _logMessage(message, priority);
    }
  }

  void _logMessage(String message, int priority) {
    switch (priority) {
      case priorityLogDebug:
        _logger.d(message);
        break;
      case priorityLogWarn:
        _logger.w(message);
        break;
      case priorityLogError:
        _logger.e(message);
        break;
      default:
        _logger.d(message);
    }
  }
}

abstract class LogStrategy {
  /// Base method for logging.
  void log(String message, int priority, [Exception? error]);
}
