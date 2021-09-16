import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class WorkoutScreen extends StatelessWidget {
  static const route = '/workout';
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
      drawer: AppDrawer(),//By using drawer the arrow to return is replaced by the menu defined on AppDrawer.
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
