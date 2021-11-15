import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../models/workout.dart';
import '../exceptions/api_exception.dart';

class WorkoutProvider with ChangeNotifier {

  final String? userId;
  final String? token;

  WorkoutProvider([this.userId = '', this.token = '']);

  List<Workout> workouts = [];
  final String baseUrl =
      'https://workoutapp-dfe56-default-rtdb.europe-west1.firebasedatabase.app/workout';

  Future<List<Workout>> get() async {
    try {
      //return await Future.delayed(Duration(seconds: 3), () => [..._workouts]);
      print('GET ALL FROM DB');
      workouts = [];
      final response = await http.get(Uri.parse('$baseUrl.json?auth=$token&orderBy="userId"&equalTo="$userId"'));

      if (![200, 201, 202, 204].contains(response.statusCode)) {
        final message = json.decode(response.body) as Map<String, dynamic>;
        throw ApiException(response.statusCode, message['error']);
      }

      if (response.body != "null") {
        final decoded = json.decode(response.body) as Map<String, dynamic>;
        decoded.forEach((key, value) {
          workouts.add(
              Workout(key, value['name'], value['image'], value['weekDay']));
        });
      }

      return workouts;
    } on ApiException catch (eapi) {
      throw '${eapi.code} - ${eapi.message}';
    } catch (e) {
      throw (e as FormatException).message;
    }
  }

  Workout getById(String id) {
    return workouts.firstWhere((element) => element.id == id);
  }

  Future<void> add(Workout workout) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl.json?auth=$token'),
        body: json.encode(
          {
            'name': workout.name,
            'image': workout.image,
            'weekDay': workout.weekDay,
            'userId': userId!
          },
        ),
      );

      workout.id = json.decode(response.body)['name'];

      workouts.add(workout);
      notifyListeners();
    } on ApiException catch (eapi) {
      throw '${eapi.code} - ${eapi.message}';
    } catch (e) {
      throw (e as FormatException).message;
    }
  }

  Future<void> update(Workout workout) async {
    final response = await http.put(
      Uri.parse('$baseUrl/${workout.id}.json?auth=$token'),
      body: json.encode({
        'name': workout.name,
        'image': workout.image,
        'weekDay': workout.weekDay,
        'userId': workout.userId
      }),
    );
    print(response.statusCode);

    // _workouts = _workouts.map((e) {
    //   if (e.id == workout.id) {
    //     e.name = workout.name;
    //     e.image = workout.image;
    //     e.weekDay = workout.weekDay;
    //   }
    //   return e;
    // }).toList();

    final index = workouts.indexWhere((element) => element.id == workout.id);
    workouts[index] = workout;

    notifyListeners();
  }

  Future<void> delete(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id.json?auth=$token'));
    print(response.statusCode);

    workouts.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
