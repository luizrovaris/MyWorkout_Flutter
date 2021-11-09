import 'package:flutter/material.dart';
import 'package:my_workout/widgets/exercise_list.dart';
import 'package:provider/provider.dart';
import '../providers/workout_provider.dart';
import '../models/workout.dart';
import '../widgets/app_drawer.dart';
import '../widgets/today_workout.dart';
import '../utils/utils.dart';

class HomeScreen extends StatefulWidget {
  static const route = '/home';

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _weedDay = DateTime.now().weekday;

  List<TextButton> _getButtonBar() {
    List<TextButton> _list = [];

    Utils.getWeekDaysNames().forEach((key, value) {
      _list.add(
        TextButton(
          onPressed: () {
            setState(() {
              _weedDay = key;
            });
          },
          child: Text(
            value.substring(0, 3),
            style: TextStyle(
                color: _weedDay == key
                    ? Colors.white
                    : Theme.of(context).colorScheme.secondary),
          ),
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
                side: BorderSide(
                    style: BorderStyle.solid,
                    color: Theme.of(context).colorScheme.secondary),
              ),
            ),
            backgroundColor: MaterialStateProperty.all<Color?>(_weedDay == key
                ? Theme.of(context).colorScheme.secondary
                : Colors.transparent),
          ),
        ),
      );
    });

    return _list;
  }

  Widget _getTodayWorkout(List<Workout> workouts) {
    final index = workouts.indexWhere((element) => element.weekDay == _weedDay);

    if (index != -1) {
      return TodayWorkout(workouts[index].name, workouts[index].image);
    } else {
      return Text(
        'You don\'t have workouts today.',
        style: TextStyle(
          color: Colors.white,
        ),
      );
    }
  }

  Widget _getExercisesList(List<Workout> workouts) {
    final index = workouts.indexWhere((element) => element.weekDay == _weedDay);

    if (index != -1) {
      return Expanded(
        child: ExerciseList(workouts[index].id),
      );
    } else {
      return Text('');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg3.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          FutureBuilder<List<Workout>>(
            future: Provider.of<WorkoutProvider>(context, listen: false).get(),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.error != null) {
                  return Center(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          Icon(
                            Icons.error,
                            color: Colors.red,
                            size: 80,
                            ),
                          Text(
                            '${snapshot.error}',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ]),
                      ),
                    );
                } else {
                  return Padding(
                    padding: const EdgeInsets.only(top: 110),
                    child: Consumer<WorkoutProvider>(
                      builder: (_, provider, widget) {
                        return Column(
                          children: [
                            widget!,
                            _getTodayWorkout(provider.workouts),
                            _getExercisesList(provider.workouts),
                          ],
                        );
                      },
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: ButtonBar(
                          children: _getButtonBar(),
                        ),
                      ),
                    ),
                  );
                }
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
