import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/exercise.dart';
import '../providers/exercise_provider.dart';
import './exercise_card.dart';

class ExerciseList extends StatelessWidget {
  final String workoutId;
  ExerciseList(this.workoutId);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Exercise>>(
      future: Provider.of<ExerciseProvider>(context).get(workoutId),
      builder: (_, snapshot) {
        return snapshot.connectionState == ConnectionState.done
            ? ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) {
                  return ExerciseCard(
                      snapshot.data![index].id,
                      snapshot.data![index].name,
                      snapshot.data![index].description,
                      snapshot.data![index].imageUrl);
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
