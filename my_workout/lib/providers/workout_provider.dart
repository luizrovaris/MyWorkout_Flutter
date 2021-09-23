import 'package:flutter/material.dart';
import '../models/workout.dart';

class WorkoutProvider with ChangeNotifier {
  List<Workout> _workouts = [];

  List<Workout> get(){
    return [..._workouts];
  }

  void add(Workout workout){
    _workouts.add(workout);
    notifyListeners();
  }
}
