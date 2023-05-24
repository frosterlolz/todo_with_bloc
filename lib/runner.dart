import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_with_bloc/src/features/app/di/app_scope.dart';
import 'package:todo_with_bloc/src/features/app/ui/view/app_view.dart';

Future<void> run() async {
  _runApp();
}

void _initLogger() {
  // TODO(fix): NEED LOGGER HERE
}

void _runApp() {
  runZonedGuarded<Future<void>>(() async {
    /// It must be called so that the orientation does not fall.
    WidgetsFlutterBinding.ensureInitialized();

    /// Fix orientation.
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    /// Init Firebase
    // await Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform,
    // );

    /// Init local notifications
    // await NotificationService.instance.initLocalNotifications();

    /// Init background Push-notifications
    // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    final scope = AppScope();

    _initLogger();

    await scope.initTheme();
    runApp(
      AppView(
        appScope: scope,
      ),
    );
  }, (error, stack) {
    // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    // FirebaseCrashlytics.instance.recordError(error, stack);
    debugPrint('ERROR');
    debugPrint('$error');
    debugPrint('$stack');
    debugPrint('END ERROR');
  });
}

// @pragma('vm:entry-point')
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   // If you're going to use other Firebase services in the background, such as Firestore,
//   // make sure you call `initializeApp` before using other Firebase services.
//   // await Firebase.initializeApp();
//   await NotificationService.instance.showNotification(
//     message.notification?.title ?? 'no title',
//     message.notification?.body ?? 'no body',
//   );
//   debugPrint('Handling a background message: ${message.messageId}');
// }
