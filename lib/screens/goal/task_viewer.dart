import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treebeard/models/task.dart';
import 'package:treebeard/screens/goal/task_box.dart';

class TaskViewer extends StatefulWidget {
  @override
  createState() => _TaskViewerState();
}

class _TaskViewerState extends State<TaskViewer> {

  TodoList todoList;

  @override
  Widget build(BuildContext context) {
    todoList = Provider.of<TodoList>(context, listen: true);
    List<Widget> children = new List();
    children.addAll(todoList.taskList.map((x) => TaskBox(x, false)));
    children.addAll(todoList.finishList.taskList.map((x) => TaskBox(x, true)));

    return RefreshIndicator(
      onRefresh: () async { Provider.of<TodoList>(context, listen: true).notifyListeners(); },
      child: GridView.count(crossAxisCount: 3,
          children: children
      )
    );
  }

}

Widget gridViewBuilder(BuildContext context, TodoList todoList) {
  List<Widget> children = new List();
  children.addAll(todoList.taskList.map((x) => TaskBox(x, false)));
  children.addAll(todoList.finishList.taskList.map((x) => TaskBox(x, true)));
  return new GridView.count(crossAxisCount: 3,
      children: children);
}