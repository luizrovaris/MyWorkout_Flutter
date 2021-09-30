import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/exercise_provider.dart';
import '../widgets/exercise_card.dart';
import '../screens/exercise_management_screen.dart';

class ExerciseScreen extends StatelessWidget {
  static const route = '/exercise';
  @override
  Widget build(BuildContext context) {
    final Map<String, Object> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;

    return Scaffold(
      appBar: AppBar(
        title: Text('My Exercises'),
        actions: [
          IconButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(ExerciseManagementScreen.route),
            icon: Icon(Icons.add),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/bg4.jpg'),
              fit: BoxFit.cover,
            )),
          ),
          FutureBuilder(
              future: Provider.of<ExerciseProvider>(context)
                  .get(arguments['workoutId'].toString()),
              builder: (_, snapshot) {
                return ExerciseCard('name', 'description', 'imageUrl');
              }),
        ],
      ),
    );
  }
}
