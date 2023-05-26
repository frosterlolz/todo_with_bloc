import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ActivityView extends StatelessWidget {
  const ActivityView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Activity'),),
    );
  }
}
