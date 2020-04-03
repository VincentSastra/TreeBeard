import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treebeard/models/task.dart';

class TaskBox extends StatefulWidget {
  TaskBox(this.task, this.finished, Key key) :
      super(key: key);

  final Task task;
  final bool finished;

  @override
  createState() => finished ? _FinishedState(task) : _TodoState(task);
}

class _FinishedState extends State<TaskBox> {
  _FinishedState(this.task);

  Task task;

  @override
  Widget build(BuildContext context) {
    return finishBox(task);
  }
}

class _TodoState extends State<TaskBox> with SingleTickerProviderStateMixin {
  _TodoState(this.task);

  Task task;
  AnimationController _controller;
  Animation _animation;
  AnimationStatus _status = AnimationStatus.dismissed;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOutBack)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        _status = status;
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: FractionalOffset.center,
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.002)
        ..rotateX(pi * _animation.value),
      child: InkWell(
          onTap: () {
            if (_status == AnimationStatus.dismissed) {
              Provider.of<TodoList>(context, listen: false).finish(task);
              _controller.forward();
            }
          },
          child: (_animation.value < 0.5) ? todoBox(task) : 
            Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationX(pi),
                child: finishBox(task))),
    );
  }
}

Widget todoBox(Task task) {
  return new Container(
    decoration: boxPadding(),
    child: Container(
        color: Color(0xffff7f00), child: Center(child: Text(task.toString()))),
  );
}

Widget finishBox(Task task) {
  return new Container(
      decoration: boxPadding(),
      child: Container(
          child: Center(child: Text(task.toString())), color: Colors.grey));
}

BoxDecoration boxPadding() {
  return new BoxDecoration(
      border: Border.all(width: 2, style: BorderStyle.none));
}
