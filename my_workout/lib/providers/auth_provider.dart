import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthProvider with ChangeNotifier {
  final String baseUrl = 'https://identitytoolkit.googleapis.com/v1/accounts';
  final String key = 'AIzaSFyACK9EvKXEkYsv4l23DuUXS4NEQsAyJdnUCkdzI';

  String? _userId;
  String? _token;

  String? get user {
    return _userId;
  }

  String get token {
    return _token ?? '';
  }

  Future<void> manageAuth(email, password, action) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl:$action?key=$key'),
        body: jsonEncode({
          'email': email,
          'password': password,
          'returnSecureToken': true,
        }),
      );

      final decoded = json.decode(response.body) as Map<String, dynamic>;

      if (![200, 201, 202, 204].contains(response.statusCode)) {
        if (decoded['error']['message'] == 'EMAIL_EXISTS') {
          throw Exception('Email já cadastrado');
        } else if (decoded['error']['message'] == 'INVALID_EMAIL') {
          throw Exception('Email inválido');
        } else if (decoded['error']['message'] == 'WEAK_PASSWORD') {
          throw Exception('Senha muito fraca');
        } else if (decoded['error']['message'] == 'EMAIL_NOT_FOUND') {
          throw Exception('Email não encontrado');
        } else if (decoded['error']['message'] == 'INVALID_PASSWORD') {
          throw Exception('Senha inválida');
        }
      } else if (action == "signInWithPassword") {
        _userId = decoded["localId"];
        _token = decoded["idToken"];
      }
      notifyListeners();
    } catch (e) {
      throw (e as FormatException).message;
    }
  }

  void logout(){
    _userId = null;
    _token = null;
    notifyListeners();
  }
}
