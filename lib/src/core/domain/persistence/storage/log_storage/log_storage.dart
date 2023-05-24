import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class LogStorage implements ILogStorage {
  static const logFileName = 'logs.txt';

  Future<Directory> get _docsDirectory async =>
      getApplicationDocumentsDirectory();

  Future<File> get _logFile async {
    final docsPath = await _docsDirectory;

    return File('${docsPath.path}/$logFileName');
  }

  @override
  Future<String?> readLogs() async {
    try {
      final fileContent = await (await _logFile).readAsString();

      return fileContent;
    } on Object catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());

      return null;
    }
  }

  @override
  Future<void> writeLogs(StackTrace stackTrace, [Object? error]) async {
    try {
      final sink = (await _logFile).openWrite(
        mode: FileMode.writeOnlyAppend,
      );
      sink
        ..writeln('Error Name: $error')
        ..writeln('/// Start \n TimeStamp ${DateTime.now()}')
        ..writeln('$stackTrace\n')
        ..writeln()
        ..writeln('/// End \n');
      await sink.flush();
      await sink.close();
    } on Object catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
    }
  }

  @override
  Future<void> clearLogs() async {
    await (await _logFile).writeAsString('');
  }
}

abstract class ILogStorage {
  Future<String?> readLogs();
  Future<void> writeLogs(StackTrace stackTrace, [Object? error]);
  Future<void> clearLogs();
}
