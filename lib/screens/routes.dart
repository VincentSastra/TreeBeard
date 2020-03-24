import 'package:flutter/material.dart';

import 'goal/screen_goal.dart';
import 'home/screen_home.dart';

Route toGoal(Offset start) {
  return changePage(start, GoalPage());
}

Route toHome(Offset start) {
  return changePage(start, HomePage());
}

Route changePage(Offset start, Widget widget) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => widget,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = start;
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class SlideTransitionRoute<T> extends MaterialPageRoute<T> {

  Offset offset;

  SlideTransitionRoute({WidgetBuilder builder, RouteSettings settings, Offset offsetParam}) :
        offset = offsetParam,
        super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.isInitialRoute) return child;

    var begin = offset;
    var end = Offset.zero;
    var curve = Curves.ease;

    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

    return SlideTransition(
      position: animation.drive(tween),
      child: child,
    );
  }
}