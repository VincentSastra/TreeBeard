import 'package:flutter/material.dart';
import 'package:treebeard/screens/goal/screen_goal.dart';
import '../../screens/goal/screen_goal.dart';
import '../routes.dart';
import '../../widgets/bottom_bar.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  Widget content = Scaffold(
    appBar: AppBar(),
    body: Center(
      child: Text('Home Page'),
    ),
    bottomNavigationBar: bottomBar(),
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: content,
        onPanUpdate: (details) {
          if (details.delta.dx < -dragThreshold()) {
            Navigator.push(context,
                SlideTransitionRoute(builder: (context) => GoalPage(),
                    offsetParam: Offset(1.0, 0.0)));
          }
        },
      );
  }
}
