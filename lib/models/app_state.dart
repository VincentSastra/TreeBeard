import 'achievement.dart';
import 'task.dart';

class AppState {

  List<AchievementGroup> achievementGroupList;
  List<TaskGroup> taskGroupList;
  TodoList todoList = TodoList();

  AppState() {
    // if data exist, load from persists, else
    todoList.add(Task("wash hands"));
    todoList.add(Task("say hello"));
    todoList.add(Task("goodnight"));
    todoList.finishList.add(Task("guccin gang"));

  }

}
