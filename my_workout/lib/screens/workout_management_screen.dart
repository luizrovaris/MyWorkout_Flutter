import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/workout_provider.dart';
import '../models/workout.dart';
import '../utils/utils.dart';

class WorkoutManagementScreen extends StatefulWidget {
  static const route = '/workout-management';
  @override
  State<StatefulWidget> createState() => WorkoutManagementScreenState();
}

class WorkoutManagementScreenState extends State<WorkoutManagementScreen> {
  Workout _workout = Workout();

  final _imageFocus = FocusNode();
  final _dropDownFocus = FocusNode();
  final _form = GlobalKey<FormState>();
  bool isInit = true;

  bool _dropDownValid = true;
  int _dropDownValue = 0;

  void _save() async {
    try {
      if (_dropDownValue > 0) {
        setState(() {
          _dropDownValid = true;
        });
      } else {
        setState(() {
          _dropDownValid = false;
        });
      }

      bool valid = _form.currentState!.validate();
      if (valid && _dropDownValid) {
        _form.currentState?.save();
        _workout.weekDay = _dropDownValue;

        if (_workout.id != '') {
          await Provider.of<WorkoutProvider>(context, listen: false)
              .update(_workout);
        } else {
          await Provider.of<WorkoutProvider>(context, listen: false)
              .add(_workout);
        }

        Navigator.of(context).pop();
      }
    } catch (e) {}
  }

  void _delete() async {
    Navigator.of(context).pop();
    await Provider.of<WorkoutProvider>(context, listen: false)
        .delete(_workout.id);
    Navigator.of(context).pop();
  }

  void _showConfirmationModal() {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text('Are you sure that you want to delete this workout?'),
            content: Text('This action won\'t be undone.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: _delete,
                child: Text('Delete'),
              ),
            ],
          );
        });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (isInit) {
      final Map<String, Object> arguments =
          ModalRoute.of(context)!.settings.arguments as Map<String, Object>;

      if (arguments['id'] != null) {
        _workout = Provider.of<WorkoutProvider>(context, listen: false)
            .getById(arguments['id'].toString());
        _dropDownValue = _workout.weekDay;
      }

      isInit = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, Object> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;

    return Scaffold(
      appBar: AppBar(
        title: Text(arguments["title"].toString()),
        actions: _workout.id != ''
            ? [
                IconButton(
                  onPressed: _showConfirmationModal,
                  icon: Icon(Icons.delete),
                ),
              ]
            : [],
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
              key: _form,
              child: ListView(
                children: [
                  TextFormField(
                      initialValue: _workout.name,
                      onSaved: (value) => _workout.name = value!,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) =>
                          FocusScope.of(context).requestFocus(_imageFocus),
                      decoration: InputDecoration(labelText: 'Name'),
                      validator: (value) {
                        if (value!.isEmpty || value.length < 3) {
                          return 'Name must be greater than 3 characters.';
                        }
                        return null;
                      }),
                  TextFormField(
                    initialValue: _workout.image,
                    onSaved: (value) => _workout.image = value!,
                    focusNode: _imageFocus,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) =>
                        FocusScope.of(context).requestFocus(_dropDownFocus),
                    decoration: InputDecoration(labelText: 'Image URL'),
                    validator: (value) {
                      if (value!.isEmpty &&
                          (!value.startsWith('http://') &&
                              !value.startsWith('https://'))) {
                        return 'Invalid image URL address.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 0.5,
                  ),
                  DropdownButtonHideUnderline(
                    child: Container(
                      color: Theme.of(context).inputDecorationTheme.fillColor,
                      padding: EdgeInsets.all(15),
                      child: DropdownButton(
                        value: _dropDownValue,
                        focusNode: _dropDownFocus,
                        items: Utils.getWeekDaysList()
                            .map(
                              (e) => DropdownMenuItem(
                                child: Text(e['name'].toString()),
                                value: e['id'],
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            _dropDownValue = value as int;
                          });
                        },
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _dropDownValid ? '' : 'Select one item.',
                      style: TextStyle(
                        color: Theme.of(context).errorColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _save,
                      child: Text(
                        'Save',
                        style: TextStyle(
                          color: Theme.of(context).textTheme.headline1?.color,
                        ),
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
