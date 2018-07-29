import 'package:flutter/material.dart';

import './app_drawer.dart';
import './app_form.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.red),
        home: Scaffold(
          appBar: AppBar(title: Text("Hello Wrl")),
          body: Center(child: AppForm()),
          drawer: AppDrawer(),
          endDrawer: Drawer(),
        ));
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.red),
        home: Scaffold(
          appBar: AppBar(title: Text("Päge 2")),
          body: Center(child: Text('My Page!')),
          // drawer: AppDrawer(),
        ));
  }
}
