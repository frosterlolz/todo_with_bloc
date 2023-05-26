import 'package:auto_route/auto_route.dart';
import 'package:todo_with_bloc/src/features/activity/ui/view/activity_view.dart';
import 'package:todo_with_bloc/src/features/home/ui/view/home_view.dart';
import 'package:todo_with_bloc/src/features/navigation/domain/entity/app_route_paths.dart';
import 'package:todo_with_bloc/src/features/navigation/domain/entity/home/home_route.dart';
import 'package:todo_with_bloc/src/features/navigation/domain/entity/temp/temp_route.dart';
import 'package:todo_with_bloc/src/features/news/ui/view/news_view.dart';
import 'package:todo_with_bloc/src/features/profile/ui/view/profile_view.dart';
import 'package:todo_with_bloc/src/features/temp/ui/view/temp_view.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
// ignore_for_file: prefer-match-file-name
class AppRouter extends _$AppRouter {
  static final AppRouter _router = AppRouter._();

  @override
  final List<AutoRoute> routes = [
    tempRoute,
    // RedirectRoute(path: '*', redirectTo: AppRoutePaths.temp),
  ];

  @override
  RouteType get defaultRouteType => const RouteType.material();

  AppRouter._();

  /// Singleton instance of [AppRouter]
  factory AppRouter.instance() => _router;
}
