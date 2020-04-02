import 'package:flutter/cupertino.dart';

import 'achievement.dart';

class TaskGroup {

  String name;
  List<Task> taskList;

  TaskGroup(String nameParam) { name = nameParam; }

  void add(Task task) {
    taskList.add(task);
  }
}

class Task {

  String name;

  List<Achievement> achievementList = new List<Achievement>();

  Task(String nameParam) { name = nameParam;}

  void finishTask() {
    for (Achievement achievement in achievementList) {
      achievement.addCount();
    }
  }

  String toString() {
    return name;
  }

}

class FinishList extends ChangeNotifier {

  List<Task> taskList = new List<Task>();

  List<Task> reset() {

    List<Task> returnList = new List<Task>()..addAll(taskList);
    taskList.clear();
    notifyListeners();

    return returnList;
  }

  void add(Task task) {
    taskList.add(task);
  }

}

/// USE ONLY THIS CLASS TO FINISH A TASK
class TodoList extends ChangeNotifier {

  FinishList finishList = new FinishList();
  List<Task> taskList = new List<Task>();

  void add(Task task) {
    taskList.add(task);
    notifyListeners();
  }

  void finish(Task task) {
    task.finishTask();
    taskList.remove(task);
    finishList.add(task);
    notifyListeners();
  }

  void reset() {
    taskList.addAll(finishList.reset());
    notifyListeners();
  }

  TodoList value() {
    return this;
  }

}