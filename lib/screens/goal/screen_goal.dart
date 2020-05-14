import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:treebeard/models/task.dart';
import 'package:treebeard/screens/goal/add_task_page.dart';
import 'package:treebeard/screens/goal/custom_app_bar.dart';
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
        appBar: CustomAppBar(addTasksButton(context), null,
            Color(0x8f355a24)),
        body: Container(
          color: Color(0xfffaf3e3),
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

Widget addTasksButton(BuildContext context) {
  return IconButton(
      icon: Icon(Icons.control_point),
    onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddTaskPage()),
        );
    },
  );
}

