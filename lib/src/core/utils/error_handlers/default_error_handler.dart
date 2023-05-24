import 'package:todo_with_bloc/src/core/domain/persistence/storage/log_storage/log_storage.dart';
import 'package:todo_with_bloc/src/core/utils/error_handlers/error_handler.dart';
import 'package:todo_with_bloc/src/core/utils/logger.dart';

class DefaultErrorHandler implements ErrorHandler {
  @override
  void handleError(Object error, {StackTrace? stackTrace}) {
    // ignore_for_file: avoid_print
    // print('DEFAULT ERROR HANDLER');
    // print(error);
    // print(stackTrace);
    // print('END DEFAULT ERROR HANDLER');
    LogStorage().writeLogs(stackTrace ?? StackTrace.empty, error);
    logger.d(stackTrace, error);
  }
}

/*
logger.v("Verbose log");

logger.d("Debug log");

logger.i("Info log");

logger.w("Warning log");

logger.e("Error log");

logger.wtf("What a terrible failure log");
 */
