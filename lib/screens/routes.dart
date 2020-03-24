import 'package:flutter/material.dart';

import 'goal/screen_goal.dart';
import 'home/screen_home.dart';

/// A global variable of the threshold of the drag to change page
int dragThreshold() {
  return 10;
}

class SlideTransitionRoute<T> extends MaterialPageRoute<T> {

  Offset offset;

  /// A page route that slides the end page from offset Offset
  SlideTransitionRoute({WidgetBuilder builder, RouteSettings settings, Offset offsetParam}) :
        offset = offsetParam,
        super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.isInitialRoute) return child;

    // Adapted from https://flutter.dev/docs/cookbook/animation/page-route-animation
    var begin = offset;
    var end = Offset.zero;
    var curve = Curves.ease;

    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

    return SlideTransition(
      position: animation.drive(tween),
      child: child,
    );
  }

  @override
  Duration get transitionDuration => const Duration(seconds: 2);
}
