import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  static const route = '/login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  final _user = {'email': '', 'password': '', 'confirmPassword': ''};
  final _formKey = GlobalKey<FormState>();
  final _passwordFocus = FocusNode();
  final _confirmPasswordFocus = FocusNode();
  bool loading = false;
  bool _login = true;
  late AnimationController _controller;
  late Animation<Size> _heightAnimation;

  void _showAlert(String title, String content) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
          );
        });
  }

  void _switchMode() {
    if (_login){
      _controller.forward();
    } else {
      _controller.reverse();
    }

    setState(() {
      _login = !_login;
    });
  }

  void _save() async {
    bool isValid = _formKey.currentState!.validate();

    if (isValid) {
      try {
        _formKey.currentState!.save();

        if (_login) {
          await Provider.of<AuthProvider>(context, listen: false).manageAuth(
              _user['email'], _user['password'], 'signInWithPassword');
        } else {
          if (_user['password'] == _user['confirmPassword']) {
            await Provider.of<AuthProvider>(context, listen: false)
                .manageAuth(_user['email'], _user['password'], 'signUp');
            _formKey.currentState!.reset();
            _showAlert('Success', 'You can use the app now.');
            setState(() {
              _login = true;
            });
          } else {
            _showAlert('Invalid form', 'The passwords don\'t match.');
          }
        }
      } catch (e) {
        _showAlert('Error', e as String);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 500,
      ),
    );

    _heightAnimation = Tween<Size>(
            begin: Size(double.infinity, 200), end: Size(double.infinity, 0))
        .animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    );

    _heightAnimation.addListener(() { setState(() {});});
  }

  @override void dispose() {
    super.dispose();

    _controller.dispose();
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
                  height: _heightAnimation.value.height,
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
                //if (!_login)
                  AnimatedOpacity(
                    opacity: _login ? 0 : 1,
                    duration: Duration(microseconds: 500),
                    child: TextFormField(
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
