import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treebeard/models/app_state.dart';
import 'package:treebeard/screens/home/screen_home.dart';
import '../routes.dart';

class GoalPage extends StatefulWidget {

  @override
  _GoalPageState createState() => _GoalPageState();

}

class _GoalPageState extends State<GoalPage> {

  final AppState appState = AppState();


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        if (details.delta.dx > dragThreshold()) {
          Navigator.pop(context);
        }
      },
      child: MultiProvider(
          providers: [
            ChangeNotifierProvider.value(value: appState.todoList),
            ChangeNotifierProvider.value(value: appState.todoList.finishList)
          ],
          // TODO: FINISH HOW THE PAGE WILL LOOK IN THIS CHILD SECTION
          child: Column(

          )
    ),
    );
  }



}
