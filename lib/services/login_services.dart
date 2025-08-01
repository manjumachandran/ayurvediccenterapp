
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

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['token']; // Adjust based on actual response
    } else {
      debugPrint("Login failed: ${response.body}");
      return null;
    }
  }
}
