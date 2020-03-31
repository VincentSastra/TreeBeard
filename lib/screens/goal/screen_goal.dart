import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treebeard/models/app_state.dart';
import 'package:treebeard/models/task.dart';
import 'package:treebeard/screens/goal/custom_app_bar.dart';
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
        ],
        child: Scaffold(
          appBar: CustomAppBar(Icon(Icons.control_point)),
          body: Center(
            child: Consumer<TodoList>(
                builder: (BuildContext context, TodoList todoList, _) {
                  return gridViewBuilder(context, todoList);
            }),
          ),
        ),
      ),
    );
  }
}

GridView gridViewBuilder(BuildContext context, TodoList todoList) {
  List<Widget> children = new List();
  children.addAll(todoList.taskList.map((x) => todoBox(context, x)));
  children.addAll(todoList.finishList.taskList.map((x) => finishBox(x)));
  return new GridView.count(crossAxisCount: 3,
      children: children);
}

Widget todoBox(BuildContext context, Task task) {
  return InkWell(
    onTap: () => Provider.of<TodoList>(context, listen: false).finish(task),
    child: new Container(
      child: Text(task.toString()),
      color: Colors.cyan
    ),
  );
}

Widget finishBox(Task task) {
  return new Container(
    child: Text(task.toString()),
    color: Colors.grey,
  );
}
