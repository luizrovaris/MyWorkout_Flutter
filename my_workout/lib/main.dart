import 'package:flutter/material.dart';
import '../screens/workout_management_screen.dart';
import '../screens/workout_screen.dart';
import '../screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Color greenButtons = Color.fromRGBO(0, 223, 100, 1);
  Color greenButtonHover = Color.fromRGBO(179, 255, 213, 1);

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Color.fromRGBO(29, 34, 37, 0.9)),
        canvasColor: Colors.transparent,
        accentColor: greenButtons,
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
              color: Color.fromRGBO(151, 152, 152, 1)),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            foregroundColor:
                MaterialStateProperty.resolveWith((states) => greenButtons),
            overlayColor:
                MaterialStateProperty.resolveWith((states) => greenButtonHover),
            side:
                MaterialStateProperty.resolveWith<BorderSide>((_) => BorderSide(
                      color: greenButtons,
                      width: 2,
                    )),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor:
                MaterialStateProperty.resolveWith((states) => greenButtons),
            overlayColor:
                MaterialStateProperty.resolveWith((states) => greenButtonHover),
          ),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: greenButtons,
          textTheme: ButtonTextTheme.primary,
          colorScheme:
              Theme.of(context).colorScheme.copyWith(primary: greenButtons),
          focusColor: greenButtonHover,
        ),
      ),
      //initialRoute: '/other_screen', //Can be used to change initial screen route (by default is home ('/'))
      //home: HomeScreen(), //Mapped above, on routes...
      routes: {
        HomeScreen.route: (_) => HomeScreen(),
        WorkoutScreen.route: (_) => WorkoutScreen(),
        WorkoutManagementScreen.route: (_) => WorkoutManagementScreen(),
      },
    );
  }
}
