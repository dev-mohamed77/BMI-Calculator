import 'package:flutter/material.dart';
import 'constans.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    bool isActive = false;
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: kRectangleMaleAndFemaleColor,
            ),
            child: Center(
              child: Text(
                "BMI Calculator",
                style: Theme.of(context).textTheme.title,
              ),
            ),
          ),
          SwitchListTile(
            title: Text(
              "Dark Mode",
              style: Theme.of(context).textTheme.title,
            ),
            value: isActive,
            onChanged: (bool value) {
              setState(() {
                setState(() {
                  isActive = value;
                });
              });
            },
          )
        ],
      ),
    );
  }
}
