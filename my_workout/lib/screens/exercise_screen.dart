import 'package:flutter/material.dart';

class ExerciseScreen extends StatelessWidget {
  static const route = '/exercise';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Exercises'),
        actions: [
          IconButton(
              onPressed: () => print('Add pressed'), icon: Icon(Icons.add))
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
              )
            ),
          )
        ],
      ),
    );
  }
}
