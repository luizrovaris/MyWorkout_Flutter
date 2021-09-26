import 'package:flutter/material.dart';
import '../screens/exercise_screen.dart';
import '../widgets/workout_screen_custom_clipper.dart';

class WorkoutCard extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          SizedBox(
            width: _mediaQuery.size.width * 0.4,
            child: ClipPath(
              clipper: WorkoutScreenCustomClipper(),
              child: Image(
                image: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgYKHf6Ew5627UAWEpnlAAFDP1p2Z4_iasyg&usqp=CAU'),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Running',
                  style: Theme.of(context).textTheme.headline4,
                ),
                Text(
                  'Sunday',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlinedButton(
                      onPressed: () => Navigator.of(context)
                          .pushNamed(ExerciseScreen.route),
                      child: Text('Exercises'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}