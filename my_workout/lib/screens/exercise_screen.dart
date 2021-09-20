import 'package:flutter/material.dart';
import '../screens/exercise_management_screen.dart';

class ExerciseScreen extends StatelessWidget {
  static const route = '/exercise';
  @override
  Widget build(BuildContext context) {
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
          Padding(
            padding: const EdgeInsets.only(top: 115),
            child: Card(
              child: ListTile(
                title: Text(
                  'Running 60 min',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  'Keep running speed for 60 minutes.',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.subtitle2?.color,
                  ),
                ),
                leading: Image.network(
                  'https://img.icons8.com/bubbles/2x/timer.png',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                trailing: IconButton(
                  onPressed: () => print('Remove pressed'),
                  icon: Icon(Icons.delete),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
