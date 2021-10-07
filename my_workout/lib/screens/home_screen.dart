import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/workout_provider.dart';
import '../models/workout.dart';
import '../widgets/app_drawer.dart';
import '../widgets/today_workout.dart';
import '../utils/utils.dart';

class HomeScreen extends StatefulWidget {
  static const route = '/';

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
                    : Theme.of(context).accentColor),
          ),
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
                side: BorderSide(
                    style: BorderStyle.solid,
                    color: Theme.of(context).accentColor),
              ),
            ),
            backgroundColor: MaterialStateProperty.all<Color?>(_weedDay == key
                ? Theme.of(context).accentColor
                : Colors.transparent),
          ),
        ),
      );
    });

    return _list;
  }

  Widget _getTodayWorkout(List<Workout> workouts){
    final index = workouts.indexWhere((element) => element.weekDay == _weedDay);

    if (index != -1 ){
      return TodayWorkout(workouts[index].name, workouts[index].image);
    } else {
      return Text('You don\'t have workouts today.');
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
            future: Provider.of<WorkoutProvider>(context).get(),
            builder: (_, snapshot) {
              return snapshot.connectionState == ConnectionState.done
                  ? Padding(
                      padding: const EdgeInsets.only(top: 110),
                      child: Column(
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: ButtonBar(
                              children: _getButtonBar(),
                            ),
                          ),
                          _getTodayWorkout(snapshot.data!),
                        ],
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    );
            },
          ),
        ],
      ),
    );
  }
}
