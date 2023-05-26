import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:todo_with_bloc/src/features/navigation/service/router.dart';

part '../widgets/bottom_navigation_bar.dart';

@RoutePage()
class TempView extends StatelessWidget {
  const TempView({Key? key}) : super(key: key);

  List<PageRouteInfo> get routes => [
        const HomeRoute(),
        const NewsRoute(),
        const ActivityRoute(),
        const ProfileRoute(),
      ];

  @override
  Widget build(BuildContext context) {
    final items = <String, Widget>{
      'Главная': const Icon(Icons.home_outlined),
      'Новости': const Icon(Icons.newspaper_outlined),
      'Активность': const Icon(Icons.local_activity_outlined),
      'Профиль': const Icon(Icons.person_outline)
    };

    return AutoTabsRouter(
      routes: routes,
      transitionBuilder: (context, child, animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      builder: (ctx, child) {
        final tabsRouter = AutoTabsRouter.of(ctx);

        return Scaffold(
          body: child,
          bottomNavigationBar:
              // BottomNavigationBar(
              //   items: [
              //     const BottomNavigationBarItem(
              //         icon: Icon(Icons.home), label: 'Home'),
              //     const BottomNavigationBarItem(
              //         icon: Icon(Icons.newspaper), label: 'news'),
              //     const BottomNavigationBarItem(
              //         icon: Icon(Icons.local_activity_outlined), label: 'activity'),
              //     const BottomNavigationBarItem(
              //         icon: Icon(Icons.person), label: 'profile'),
              //   ],
              // ),
              _BottomNavigationBar(
            items: items,
            onTap: tabsRouter.setActiveIndex,
          ),
        );
      },
    );
  }
}
