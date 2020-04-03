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
    children.addAll(todoList.taskList.map((x) => TaskBox(x, false, UniqueKey())));
    children.addAll(todoList.finishList.taskList.map((x) => TaskBox(x, true, UniqueKey())));

    return RefreshIndicator(
      onRefresh: () async {
        todoList.refresh();
      },
      child: GridView.count(crossAxisCount: 3,
          children: children
      ),
    );
  }

}
