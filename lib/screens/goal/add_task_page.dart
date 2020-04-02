import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:treebeard/screens/goal/screen_goal.dart';

import 'custom_app_bar.dart';

class AddTaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //List<Widget> columnList = new List();
    // for loop

    return Scaffold(
      appBar: CustomAppBar(addTasksButton(context), null, Colors.white),
      //body: SliverList(
        //delegate: SliverChildListDelegate(
            //columnList,
        //),
      //),
    );
  }



}