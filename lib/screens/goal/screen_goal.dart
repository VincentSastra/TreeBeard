import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treebeard/models/task.dart';
import 'package:treebeard/screens/goal/custom_app_bar.dart';
import 'package:treebeard/screens/goal/task_box.dart';
import 'package:treebeard/screens/goal/task_viewer.dart';
import '../routes.dart';

class GoalPage extends StatefulWidget {
  @override
  _GoalPageState createState() => _GoalPageState();
}

class _GoalPageState extends State<GoalPage> {

  @override
  Widget build(BuildContext context) {
    TodoList todoList = Provider.of<TodoList>(context);

    return GestureDetector(
      onPanUpdate: (details) {
        if (details.delta.dx > dragThreshold()) {
          Navigator.pop(context);
        }
      },

      child: Scaffold(
        appBar: CustomAppBar(Icon(Icons.control_point), resetButton(context)),
        body: Container(
          color: Color(0x7fff7f00),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TaskViewer(),
            // child: gridViewBuilder(context, todoList),
            ),
          ),
        ),
      );
  }
}

Widget resetButton(BuildContext context) {
  return InkWell(
    onTap: () => Provider.of<TodoList>(context, listen: false).reset(),
    child: new Icon(Icons.refresh)
  );
}
