import 'package:flutter/material.dart';
import '../screens/workout_management_screen.dart';
import '../utils/utils.dart';
import '../screens/exercise_screen.dart';
import '/widgets/workout_screen_custom_clipper.dart';

class WorkoutCard extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String name;
  final int weedDay;

  WorkoutCard(this.id, this.imageUrl, this.name, this.weedDay);

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(
        WorkoutManagementScreen.route,
        arguments: {'title': 'Editing $name', 'id': id},
      ),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            SizedBox(
              width: _mediaQuery.size.width * 0.4,
              child: ClipPath(
                clipper: WorkoutScreenCustomClipper(),
                child: Image(
                  image: NetworkImage(this.imageUrl),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    this.name,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Text(
                    Utils.getWeekDaysNames()[this.weedDay].toString(),
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlinedButton(
                        onPressed: () => Navigator.of(context).pushNamed(
                            ExerciseScreen.route,
                            arguments: {'workoutId': this.id}),
                        child: Text('Exercises'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
