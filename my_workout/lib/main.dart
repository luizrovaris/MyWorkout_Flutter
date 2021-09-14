import 'package:flutter/material.dart';
import './screens/home_screen.dart';

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
        visualDensity: VisualDensity.adaptivePlatformDensity,
        cardColor: Color.fromRGBO(60, 70, 72, 0.9),
        scaffoldBackgroundColor: Color.fromRGBO(29, 34, 37, 0.9),
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          subtitle2: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(151, 152, 152, 1)
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}