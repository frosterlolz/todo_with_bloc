import 'package:auto_route/auto_route.dart';
import 'package:todo_with_bloc/src/features/navigation/domain/entity/app_route_paths.dart';
import 'package:todo_with_bloc/src/features/navigation/service/router.dart';

final activityRoute = AutoRoute(
  path: AppRoutePaths.activity,
  page: ActivityRoute.page,
);
