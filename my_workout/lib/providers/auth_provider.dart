import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthProvider with ChangeNotifier {
  final String baseUrl = 'https://identitytoolkit.googleapis.com/v1/accounts';
  final String key = 'FakeKey';

  Future<void> manageAuth(email, password, action) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl:$action?key=[$key]'),
        body: jsonEncode({
          'email': email,
          'password': password
        }),
      );

      print(response.statusCode);
      print(response.body);
      
      notifyListeners();
    } catch (e) {
      throw (e as FormatException).message;
    }
  }
}
