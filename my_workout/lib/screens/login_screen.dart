import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _user = {'email': '', 'password': '', 'confirmPassword': ''};
  final _formKey = GlobalKey<FormState>();
  final _passwordFocus = FocusNode();
  final _confirmPasswordFocus = FocusNode();
  bool loading = false;
  bool _login = true;

  void _switchMode() {
    setState(() {
      _login = !_login;
    });
  }

  void _save(){
    bool isValid = _formKey.currentState!.validate();

    if (isValid){
      _formKey.currentState!.save();
      print(_user);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg1.jpg'), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                SizedBox(
                  height: 140,
                  child: Text(
                    'MyWorkout',
                    style: TextStyle(
                      fontSize: 55,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
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
                  onSaved: (value) => _user['email'] = value!,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  focusNode: _passwordFocus,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) => FocusScope.of(context)
                      .requestFocus(_confirmPasswordFocus),
                  validator: (value) {
                    String? response;
                    if (value!.length < 6) {
                      response = 'The password is too short.';
                    }
                    return response;
                  },
                  obscureText: true,
                  onSaved: (value) => _user['password'] = value!,
                ),
                if (!_login)
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
                    onSaved: (value) => _user['confirmPassword'] = value!,
                  ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _save,
                      child: Text(
                        _login ? 'Enter' : 'Register',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: _switchMode,
                  child: Text(_login
                      ? 'I don\'t have an account'
                      : 'I already have an account'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
