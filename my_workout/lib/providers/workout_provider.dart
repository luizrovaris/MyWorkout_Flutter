import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../models/workout.dart';

class WorkoutProvider with ChangeNotifier {
  List<Workout> _workouts = [];
  final String baseUrl =
      'https://workoutapp-dfe56-default-rtdb.europe-west1.firebasedatabase.app/workout.json';

  Future<List<Workout>> get() async {
    //return await Future.delayed(Duration(seconds: 3), () => [..._workouts]);
    List<Workout> workouts = [];
    final response = await http.get(Uri.parse(this.baseUrl));
    final decoded = json.decode(response.body) as Map<String, dynamic>;
    decoded.forEach((key, value) {
      workouts
          .add(Workout(key, value['name'], value['image'], value['weekDay']));
    });

    return workouts;
  }

  Workout getById(String id) {
    return _workouts.firstWhere((element) => element.id == id);
  }

  Future<void> add(Workout workout) async {
    print('VAI SALVAR');
    final response = await http.post(
      Uri.parse(this.baseUrl),
      body: json.encode(
        {
          'name': workout.name,
          'image': workout.image,
          'weekDay': workout.weekDay
        },
      ),
    );

    print(response.statusCode);
    print(response.body);

    notifyListeners();
  }

  Future<void> update(Workout workout) async {
    _workouts = _workouts.map((e) {
      if (e.id == workout.id) {
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
