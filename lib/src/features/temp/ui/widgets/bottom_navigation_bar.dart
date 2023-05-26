part of '../view/temp_view.dart';

class _BottomNavigationBar extends StatelessWidget {
  final Map<String, Widget> items;
  final void Function(int) onTap;
  const _BottomNavigationBar({
    required this.items,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: AutoTabsRouter.of(context).activeIndex,
      onTap: onTap,
      items: items
          .map<String, BottomNavigationBarItem>(
            (key, value) => MapEntry(
              key,
              BottomNavigationBarItem(
                icon: value,
                label: key,
              ),
            ),
          )
          .values
          .toList(),
    );
  }
}

// class SampleBottomNavBarItem implements BottomNavigationBarItem{
//   @override
//   // TODO: implement activeIcon
//   Widget get activeIcon => throw UnimplementedError();
//
//   @override
//   // TODO: implement backgroundColor
//   Color? get backgroundColor => throw UnimplementedError();
//
//   @override
//   // TODO: implement icon
//   Widget get icon => throw UnimplementedError();
//
//   @override
//   // TODO: implement label
//   String? get label => throw UnimplementedError();
//
//   @override
//   // TODO: implement tooltip
//   String? get tooltip => throw UnimplementedError();
// }

// class _BottomNavigationBarItem extends BottomNavigationBarItem {
//   _BottomNavigationBarItem({
//     required super.icon,
//     super.label,
//     super.backgroundColor,
//     super.tooltip,
//   });
// }
