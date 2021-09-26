import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/workout_provider.dart';
import '../widgets/workout_card.dart';
import '../screens/exercise_screen.dart';
import '../screens/workout_management_screen.dart';
import '../widgets/workout_screen_custom_clipper.dart';
import '../widgets/app_drawer.dart';

class WorkoutScreen extends StatelessWidget {
  static const route = '/workout';
  @override
  Widget build(BuildContext context) {

    //I can listen the provider by using the 'get' to the entire widget, or by using the Consumer for a part of the widget.
    //final workouts = Provider.of<WorkoutProvider>(context).get();

    //Get the value sent from PageRoute.RouteSettings.arguments
    var valueFromSettings = ModalRoute.of(context)?.settings.arguments;
    print(valueFromSettings);

    return Scaffold(
      appBar: AppBar(
        title: Text('Workout'),
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context).pushNamed(
                    WorkoutManagementScreen.route,
                    arguments: {'title': 'New Workout'},
                  ),
              icon: Icon(Icons.add)),
        ],
      ),
      extendBodyBehindAppBar: true,
      drawer:
          AppDrawer(), //By using drawer the arrow to return is replaced by the menu defined on AppDrawer.
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 115),
            child: Consumer<WorkoutProvider>(builder: (_, provider, child) {
              return WorkoutCard();
            }),
          ),
        ],
      ),
    );
  }
}