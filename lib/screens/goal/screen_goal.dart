import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'task_box.dart';
import 'package:treebeard/models/task.dart';
import 'package:treebeard/screens/goal/custom_app_bar.dart';
import '../routes.dart';

class GoalPage extends StatefulWidget {
  @override
  _GoalPageState createState() => _GoalPageState();
}

class _GoalPageState extends State<GoalPage> {

  @override
  Widget build(BuildContext context) {
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
            child: Center(
              child: Consumer<TodoList>(
                  builder: (BuildContext context, TodoList todoList, _) {
                    return gridViewBuilder(context, todoList);
              }),
            ),
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

Widget gridViewBuilder(BuildContext context, TodoList todoList) {
  List<Widget> children = new List();
  children.addAll(todoList.taskList.map((x) => TaskBox(x, false)));
  children.addAll(todoList.finishList.taskList.map((x) => TaskBox(x, true)));
  return new GridView.count(crossAxisCount: 3,
      children: children);
}