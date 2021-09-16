import 'package:flutter/material.dart';
import '../screens/workout_screen.dart';
import '../screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Color.fromRGBO(29, 34, 37, 0.9)
        ),
        canvasColor: Colors.transparent,
        accentColor: Color.fromRGBO(0, 223, 100, 1),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        cardColor: Color.fromRGBO(60, 70, 72, 0.9),
        scaffoldBackgroundColor: Color.fromRGBO(29, 34, 37, 0.9),
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          bodyText1: TextStyle(
            color: Colors.white,
          ),
          subtitle2: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(151, 152, 152, 1)
          ),
        ),
      ),
      //initialRoute: '/other_screen', //Can be used to change initial screen route (by default is home ('/'))
      //home: HomeScreen(), //Mapped above, on routes...
      routes: {
        HomeScreen.route: (_) => HomeScreen(),
        WorkoutScreen.route: (_) => WorkoutScreen(),
      },
    );
  }
}