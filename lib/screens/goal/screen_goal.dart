import 'package:flutter/material.dart';
import 'package:treebeard/screens/home/screen_home.dart';
import '../routes.dart';

class GoalPage extends StatefulWidget {

  @override
  _GoalPageState createState() => _GoalPageState();

}

class _GoalPageState extends State<GoalPage> {

  static const dragThreshold = 0;
  Widget content = Scaffold(
    appBar: AppBar(),
    body: Center(
      child: Text('Go2al Page'),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: content,
      onPanUpdate: (details) {
        if (details.delta.dx > dragThreshold) {
          Navigator.pop(context);
        }
      },
    );
  }
}
