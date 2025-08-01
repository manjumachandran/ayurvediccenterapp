
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:machne_test/config.dart';

class LoginService {
  Future<String?> login(String username, String password) async {
    final url = Uri.parse('${baseUrl}Login');
    final response = await http.post(
      url,
      body: {
        'username': username,
        'password': password,
      },
    );

print('Status Code: ${response.statusCode}');
  print('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['token']; 
    } else {
      debugPrint("Login failed: ${response.body}");
      return null;
    }
  }
}
