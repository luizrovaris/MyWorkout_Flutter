import 'package:flutter/material.dart';
import '../models/workout.dart';

class WorkoutProvider with ChangeNotifier {
  List<Workout> _workouts = [];

  Future<List<Workout>> get(){
    return Future.delayed(Duration(seconds: 3), () => [..._workouts]);
  }

  void add(Workout workout){
    _workouts.add(workout);
    notifyListeners();
  }
}
