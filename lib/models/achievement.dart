import 'package:flutter/material.dart';

class AchievementGroup with ChangeNotifier {
  List<Achievement> achievements;

  void addAchievement(Achievement value) {
    achievements.add(value);
    notifyListeners();
  }

  void removeAchievement(Achievement value) {
    achievements.remove(value);
    notifyListeners();
  }

}

class Achievement with ChangeNotifier {
  AchievementGroup _achievementGroup;

  String name;
  int count;
  int maxCount;

  Achievement(String nameParam, int maxCountParam) {
    count = 0;
    name = nameParam;
    maxCount = maxCountParam;
  }

  void completeAchievement() {
    _achievementGroup.removeAchievement(this);
  }

  void addCount() {
    count++;
    notifyListeners();
  }

}