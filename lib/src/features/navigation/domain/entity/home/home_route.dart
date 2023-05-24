import 'package:auto_route/auto_route.dart';
import 'package:todo_with_bloc/src/features/navigation/domain/entity/app_route_paths.dart';
import 'package:todo_with_bloc/src/features/navigation/service/router.dart';

final homeRoute = AutoRoute(
  path: AppRoutePaths.home,
  page: HomeTabRoute.page,
  children: [
    AutoRoute(
      page: HomeRoute.page,
      path: '',
    ),
  ],
);

// ignore_for_file: prefer-match-file-name
@RoutePage(name: 'HomeTabRoute')
class HomeTab extends AutoRouter {
  const HomeTab({super.key});
}
