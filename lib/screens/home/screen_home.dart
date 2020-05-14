import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget content = Scaffold(
    appBar: AppBar(),
    body: Center(
      child: Text('Home Page'),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return content;
  }
}
