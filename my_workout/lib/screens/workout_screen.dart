import 'package:flutter/material.dart';
import '../widgets/workout_screen_custom_clipper.dart';
import '../widgets/app_drawer.dart';

class WorkoutScreen extends StatelessWidget {
  static const route = '/workout';
  @override
  Widget build(BuildContext context) {
    //Get the value sent from PageRoute.RouteSettings.arguments
    var valueFromSettings = ModalRoute.of(context)?.settings.arguments;
    print(valueFromSettings);

    var _mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Workout'),
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
            child: Card(
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
                              onPressed: () => print('Exercises'),
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
          ),
        ],
      ),
    );
  }
}
