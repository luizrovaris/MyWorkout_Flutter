import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../models/exercise.dart';

class ExerciseProvider with ChangeNotifier {
  final String baseUrl =
      'https://workoutapp-dfe56-default-rtdb.europe-west1.firebasedatabase.app/exercise';

  Future<List<Exercise>> get(String workoutId) async {
    List<Exercise> exercises = [];
    final response = await http.get(
        Uri.parse('$baseUrl.json?orderBy="workOutId"&equalTo="$workoutId"'));
    if (response.body != "null") {
      final decoded = json.decode(response.body) as Map<String, dynamic>;

      decoded.forEach((key, value) {
        exercises.add(Exercise(
          key,
          value['name'],
          value['description'],
          value['imageUrl'],
          value['workOutId'],
        ));
      });
    }

    return exercises;
  }

  Future<void> add(Exercise exercise) async {
    final response = await http.post(
      Uri.parse('$baseUrl.json'),
      body: json.encode(
        {
          'name': exercise.name,
          'description': exercise.description,
          'imageUrl': exercise.imageUrl,
          'workOutId': exercise.workOutId
        },
      ),
    );

    notifyListeners();
  }

  Future<void> delete(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id.json'));
    notifyListeners();
  }
}
