import 'package:flutter/material.dart';

import './main.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text("Drawer yoio"),
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/cph.png")),
            ),
          ),
          ListTile(
              title: Text("Item 1"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyApp()));
              }),
          ListTile(
              title: Text("Item 2"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SecondScreen()));
              }),
        ],
      ),
    );
  }
}
