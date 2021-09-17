import 'package:flutter/material.dart';

class WorkoutManagementScreen extends StatefulWidget {
  static const route = '/workout-management';
  @override
  State<StatefulWidget> createState() => WorkoutManagementScreenState();
}

class WorkoutManagementScreenState extends State<WorkoutManagementScreen> {
  @override
  Widget build(BuildContext context) {
    
    final Map<String, Object> arguments = ModalRoute.of(context)!.settings.arguments as Map<String, Object>;

    return Scaffold(
      appBar: AppBar(
        title: Text(arguments["title"].toString()),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg2.jpg'),
              )
            ),
          )
        ],
      ),
    );
  }


}
