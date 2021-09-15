import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/workout_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color.fromRGBO(29, 36, 41, 0.8),
        child: ListView(
          children: [
            ListTile(
              leading: Icon(
                Icons.home,
                color: Theme.of(context).accentColor,
              ),
              title: Text('Home'),
              onTap: () => HomeScreen(),
            ),
            ListTile(
              leading: Icon(
                Icons.fitness_center,
                color: Theme.of(context).accentColor,
              ),
              title: Text('Workouts'),
              onTap: () => Navigator.of(context).push(
                Platform.isIOS
                    ? CupertinoPageRoute(
                        builder: (_) => WorkoutScreen(),
                        settings: RouteSettings(arguments: 1),
                      )
                    : MaterialPageRoute(
                        builder: (_) => WorkoutScreen(),
                        settings: RouteSettings(arguments: {'Key' : 'Value'}),
                      ),
              ), //RouteSettings can be used to send args to the widget that is being opened.
            ),
          ],
        ),
      ),
    );
  }
}
