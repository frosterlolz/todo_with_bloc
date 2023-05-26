import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class NewsView extends StatelessWidget {
  const NewsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
    );
  }
}
