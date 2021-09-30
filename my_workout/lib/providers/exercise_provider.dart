import 'package:flutter/material.dart';
import '../models/exercise.dart';

class ExerciseProvider with ChangeNotifier{
  List<Exercise> _exercises = [];

  Future<List<Exercise>> get(String workoutId) async{
    List<Exercise> filteredExercises = [];

    _exercises.forEach((element) {
      if (element.workOutId == workoutId){
        filteredExercises.add(element);
      }
    });

    return filteredExercises;
  }

  Future<void> add(Exercise exercise) async {
    _exercises.add(exercise);
    notifyListeners();
  }

  Future<void> delete(String id) async {
    _exercises.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}