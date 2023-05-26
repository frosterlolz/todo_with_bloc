import 'package:auto_route/auto_route.dart';
import 'package:todo_with_bloc/src/features/navigation/domain/entity/activity/activity_route.dart';
import 'package:todo_with_bloc/src/features/navigation/domain/entity/app_route_paths.dart';
import 'package:todo_with_bloc/src/features/navigation/domain/entity/home/home_route.dart';
import 'package:todo_with_bloc/src/features/navigation/domain/entity/news/news_route.dart';
import 'package:todo_with_bloc/src/features/navigation/domain/entity/profile/profile_route.dart';
import 'package:todo_with_bloc/src/features/navigation/service/router.dart';

final tempRoute = AutoRoute(
  path: AppRoutePaths.temp,
  page: TempRoute.page,
  children: [
    homeRoute,
    newsRoute,
    activityRoute,
    profileRoute,
    RedirectRoute(path: '', redirectTo: AppRoutePaths.home),
  ],
);
