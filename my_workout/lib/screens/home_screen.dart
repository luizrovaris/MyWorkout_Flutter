import 'package:flutter/material.dart';
import '../widgets/today_workout.dart';
import '../utils/utils.dart';

class HomeScreen extends StatelessWidget {
  List<TextButton> _getButtonBar() {
    List<TextButton> _list = [];

    Utils.getWeekDaysNames().forEach((key, value) {
      _list.add(
        TextButton(
          onPressed: () => print('Button $value'),
          child: Text(value),
        ),
      );
    });

    return _list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ButtonBar(
              children: _getButtonBar(),
            ),
          ),
          TodayWorkout(),
        ],
      ),
    );
  }
}
