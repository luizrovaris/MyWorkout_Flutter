import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../screens/login_screen.dart';
import '../providers/workout_provider.dart';
import '../screens/exercise_management_screen.dart';
import '../screens/exercise_screen.dart';
import '../screens/workout_management_screen.dart';
import '../screens/workout_screen.dart';
import '../screens/home_screen.dart';
import '../providers/exercise_provider.dart';
import 'helpers/custom_page_transition.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Color greenButtonsAndCursor = Color.fromRGBO(0, 223, 100, 1);
  Color greenButtonHover = Color.fromRGBO(179, 255, 213, 1);
  Color grayInputs = Color.fromRGBO(48, 56, 62, 0.9);
  Color grayCard = Color.fromRGBO(60, 70, 72, 0.9);
  Color lightGrayText = Color.fromRGBO(151, 152, 152, 1);
  Color darkBackground = Color.fromRGBO(29, 34, 37, 0.9);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProxyProvider<AuthProvider, WorkoutProvider>(
          create: (_) => WorkoutProvider('', ''),
          update: (_, auth, workout) => WorkoutProvider(auth.user, auth.token),
        ),
        ChangeNotifierProxyProvider<AuthProvider, ExerciseProvider>(
          create: (_) => ExerciseProvider(''),
          update: (_, auth, exercise) =>
              ExerciseProvider(auth.token),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: AppBarTheme(color: darkBackground),
          canvasColor: Colors.transparent,
          accentColor: greenButtonsAndCursor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          cardColor: grayCard,
          scaffoldBackgroundColor: darkBackground,
          textTheme: TextTheme(
            headline1: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            bodyText1: TextStyle(
              color: Colors.white,
            ),
            subtitle1: TextStyle(
              color: Colors.white,
            ),
            subtitle2: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: lightGrayText,
            ),
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.resolveWith(
                  (states) => greenButtonsAndCursor),
              overlayColor: MaterialStateProperty.resolveWith(
                  (states) => greenButtonHover),
              side: MaterialStateProperty.resolveWith<BorderSide>(
                  (_) => BorderSide(
                        color: greenButtonsAndCursor,
                        width: 2,
                      )),
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith(
                  (states) => greenButtonsAndCursor),
              overlayColor: MaterialStateProperty.resolveWith(
                  (states) => greenButtonHover),
              side: MaterialStateProperty.resolveWith<BorderSide>(
                  (_) => BorderSide(
                        color: greenButtonsAndCursor,
                        width: 2,
                      )),
            ),
          ),
          textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.resolveWith(
                  (states) => greenButtonsAndCursor),
              overlayColor: MaterialStateProperty.resolveWith(
                  (states) => greenButtonHover),
            ),
          ),
          buttonTheme: ButtonThemeData(
            buttonColor: greenButtonsAndCursor,
            textTheme: ButtonTextTheme.primary,
            colorScheme: Theme.of(context)
                .colorScheme
                .copyWith(primary: greenButtonsAndCursor),
            focusColor: greenButtonHover,
          ),
          inputDecorationTheme: InputDecorationTheme(
            fillColor: grayInputs,
            filled: true,
            border: InputBorder.none,
            labelStyle: TextStyle(
              color: lightGrayText,
            ),
          ),
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: greenButtonsAndCursor,
            selectionHandleColor: greenButtonsAndCursor,
          ),
          dialogBackgroundColor: Color.fromRGBO(29, 34, 37, 1),
          dialogTheme: DialogTheme(
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: Theme.of(context).textTheme.headline6!.fontSize,
            ),
          ),
          pageTransitionsTheme: PageTransitionsTheme(builders: {
            TargetPlatform.android: CustomPageTransitionBuilder(),
            TargetPlatform.iOS: CustomPageTransitionBuilder(),
          })
        ),
        //initialRoute: '/other_screen', //Can be used to change initial screen route (by default is home ('/'))
        //home: HomeScreen(), //Mapped above, on routes...
        home: Consumer<AuthProvider>(
          builder: (_, provider, widget) {
            print(provider.token);
            if (provider.token != '') {
              print('Home');
              return HomeScreen();
            } else {
              print('Login');
              return LoginScreen();
            }
          },
        ),
        routes: {
          HomeScreen.route: (_) => HomeScreen(),
          WorkoutScreen.route: (_) => WorkoutScreen(),
          WorkoutManagementScreen.route: (_) => WorkoutManagementScreen(),
          ExerciseScreen.route: (_) => ExerciseScreen(),
          ExerciseManagementScreen.route: (_) => ExerciseManagementScreen(),
          LoginScreen.route: (_) => LoginScreen(),
        },
      ),
    );
  }
}
