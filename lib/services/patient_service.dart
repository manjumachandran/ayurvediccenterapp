import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:machne_test/config.dart';

class PatientService {
  Future<List<dynamic>> fetchPatients(String token) async {
  final url = Uri.parse('${baseUrl}PatientList');

  print('[PatientService] Calling GET $url with token: $token');

  final response = await http.get(
    url,
    headers: {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    },
  );

  print('[PatientService] Status code: ${response.statusCode}');
  print('[PatientService] Response body: ${response.body}');

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return data['patient'] ?? [];  // ✅ Corrected key
  } else {
    throw Exception('Failed to fetch patients');
  }
}

}
