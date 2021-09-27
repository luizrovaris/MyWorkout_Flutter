import 'package:flutter/material.dart';
import '../models/workout.dart';

class WorkoutProvider with ChangeNotifier {
  List<Workout> _workouts = [];

  Future<List<Workout>> get() async {
    return await Future.delayed(Duration(seconds: 3), () => [..._workouts]);
  }

  Future<void> add(Workout workout) async {
    _workouts.add(workout);
    notifyListeners();
  }
}
