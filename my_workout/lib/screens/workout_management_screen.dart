import 'package:flutter/material.dart';
import '../utils/utils.dart';

class WorkoutManagementScreen extends StatefulWidget {
  static const route = '/workout-management';
  @override
  State<StatefulWidget> createState() => WorkoutManagementScreenState();
}

class WorkoutManagementScreenState extends State<WorkoutManagementScreen> {
  @override
  Widget build(BuildContext context) {
    final Map<String, Object> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;

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
            )),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Form(
              child: ListView(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Name'),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Image URL'),
                  ),
                  SizedBox(
                    height: 0.5,
                  ),
                  DropdownButtonHideUnderline(
                    child: Container(
                      color: Theme.of(context).inputDecorationTheme.fillColor,
                      padding: EdgeInsets.all(15),
                      child: DropdownButton(
                        items: Utils.getWeekDaysList()
                            .map(
                              (e) => DropdownMenuItem(
                                child: Text(e['name'].toString()),
                                value: e['id'],
                              ),
                            )
                            .toList(),
                        onChanged: (value) => print(value),
                        hint: Text(
                          'Weed day',
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.subtitle2?.color),
                        ),
                        icon: Icon(Icons.calendar_today),
                        isExpanded: true,
                        iconEnabledColor: Theme.of(context).accentColor,
                        style: TextStyle(
                          fontSize:
                              Theme.of(context).textTheme.subtitle1?.fontSize,
                          color: Theme.of(context).textTheme.headline1?.color,
                        ),
                        dropdownColor: Color.fromRGBO(48, 56, 62, 0.9),
                      ),
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
