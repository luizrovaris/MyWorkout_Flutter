import 'package:flutter/material.dart';

class WorkoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Get the value sent from PageRoute.RouteSettings.arguments
    var valueFromSettings = ModalRoute.of(context)?.settings.arguments;
    print(valueFromSettings);

    return Scaffold(
      appBar: AppBar(
        title: Text('Workout'),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}
