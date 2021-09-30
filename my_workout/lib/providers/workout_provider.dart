import 'dart:math';

import 'package:flutter/material.dart';
import '../models/workout.dart';

class WorkoutProvider with ChangeNotifier {
  List<Workout> _workouts = [];

  Future<List<Workout>> get() async {
    return await Future.delayed(Duration(seconds: 3), () => [..._workouts]);
  }

  Workout getById(String id) {
    return _workouts.firstWhere((element) => element.id == id);
  }

  Future<void> add(Workout workout) async {
    workout.id = Random().nextInt(100000).toString();
    _workouts.add(workout);
    notifyListeners();
  }

  Future<void> update(Workout workout) async {
    _workouts = _workouts.map((e) {
      if (e.id == workout.id)
      {
        e.name = workout.name;
        e.image = workout.image;
        e.weekDay = workout.weekDay;
      }
      return e;
    }).toList();
    notifyListeners();
  }

  Future<void> delete(String id) async {
    _workouts.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
