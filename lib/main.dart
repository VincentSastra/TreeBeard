import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treebeard/screens/goal/screen_goal.dart';
import 'models/app_state.dart';
import 'screens/home/screen_home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final AppState appState = AppState();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: appState.todoList),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: MainPage(),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  createState() => MainPageState();
}

class MainPageState extends State<MainPage> with TickerProviderStateMixin{

  final int _startingTabCount = 2;
  List<Tab> _tabs = List<Tab>(

  );
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: _tabs.length);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: TabBarView(
          children: <Widget>[
            HomePage(),
            GoalPage()
          ],
        ),
        bottomNavigationBar: TabBar(
          labelPadding: EdgeInsets.all(0.0),
          tabs: <Widget>[
            Tab(
              child: (_tabController.index == 0 ? Center(child: _flare(true)) : Center(child: _flare(false)))
            ),
              Tab(
              child: (_tabController.index == 1 ? Center(child: _flare(true)) : Center(child: _flare(false)))
            ),
          ],
        ),
      ),
    );
  }
}

Widget _flare(bool selected) {
  return Container(
    color: Color(0xdf0080ff),
  );
}