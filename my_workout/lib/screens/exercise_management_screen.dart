import 'package:flutter/material.dart';

class ExerciseManagementScreen extends StatefulWidget {
  static const route = '/exercise-management';

  @override
  State<StatefulWidget> createState() => ExerciseManagementScreenState();
}

class ExerciseManagementScreenState extends State<ExerciseManagementScreen> {
  final _imageFocus = FocusNode();
  final _descriptionFocus = FocusNode();
  final _form = GlobalKey<FormState>();

  void _save() {
    bool isValid = _form.currentState!.validate();

    if (isValid) {
      print('Form is valid');
    } else {
      print('Invalid form.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New exercise'),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg4.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Form(
              key: _form,
              child: ListView(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Name',
                    ),
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.isEmpty || value.length < 3) {
                        return 'Name must be greater than 3 characters.';
                      }
                      return null;
                    },
                    onFieldSubmitted: (_) =>
                        FocusScope.of(context).requestFocus(_imageFocus),
                  ),
                  TextFormField(
                    focusNode: _imageFocus,
                    decoration: InputDecoration(labelText: 'Image'),
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.isEmpty &&
                          (!value.startsWith('http://') &&
                              !value.startsWith('https://'))) {
                        return 'Invalid image URL address.';
                      }
                      return null;
                    },
                    onFieldSubmitted: (_) =>
                        FocusScope.of(context).requestFocus(_descriptionFocus),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Description'),
                    focusNode: _descriptionFocus,
                    maxLength: 200,
                    minLines: 3,
                    maxLines: 5,
                    buildCounter: (_,
                            {required currentLength,
                            required isFocused,
                            maxLength}) =>
                        Text(
                      '$currentLength/$maxLength',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty || value.length < 5) {
                        return 'Description must be greater than 5 characters.';
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: SizedBox(
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
