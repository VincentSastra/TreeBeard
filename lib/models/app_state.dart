import 'achievement.dart';
import 'task.dart';

class AppState {

  List<AchievementGroup> achievementGroupList = new List();
  List<TaskGroup> taskGroupList = new List();
  TodoList todoList = TodoList();

  AppState() {
    // if data exist, load from persists, else
    todoList.add(Task("wash hands"));
    todoList.add(Task("say hello"));
    todoList.add(Task("goodnight"));
    todoList.finishList.add(Task("guccin gang"));

    taskGroupList.add(TaskGroup("Energy")
      ..add(Task("Turn off unused appliances and lights"))
      ..add(Task("...")));

  }

}
