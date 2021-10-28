import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passwordFocus = FocusNode();
  final _confirmPasswordFocus = FocusNode();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg1.jpg'),
          ),
        ),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text(
                'MyWorkout',
                style: TextStyle(
                  fontSize: 65,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) =>
                    FocusScope.of(context).requestFocus(_passwordFocus),
                validator: (value) => EmailValidator.validate(value!)
                    ? null
                    : 'Enter a valid email address',
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                focusNode: _passwordFocus,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) =>
                    FocusScope.of(context).requestFocus(_confirmPasswordFocus),
                validator: (value) {
                  String? response;
                  if (value!.length < 6) {
                    response = 'The password is too short.';
                  }
                  return response;
                },
                obscureText: true,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                ),
                focusNode: _confirmPasswordFocus,
                validator: (value) {
                  String? response;
                  if (value!.length < 6) {
                    response = 'The password is too short.';
                  }
                  return response;
                },
                obscureText: true,
              ),
              SizedBox(
                height: 30,
                child: ElevatedButton(
                  onPressed: () => print('Save'),
                  child: Text('Enter'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
