import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config.dart';

class RegisterService {
  final String token;

  RegisterService({required this.token});

  Future<List<Map<String, dynamic>>> getBranches() async {
    final response = await http.get(
      Uri.parse('${baseUrl}BranchList'),
      headers: {'Authorization': 'Token $token'},
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      if (body['status'] == true && body['branch'] != null) {
        return List<Map<String, dynamic>>.from(body['branch']);
      }
    }
    return [];
  }

  Future<List<Map<String, dynamic>>> getTreatments() async {
    final response = await http.get(
      Uri.parse('${baseUrl}TreatmentList'),
      headers: {'Authorization': 'Token $token'},
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      if (body['status'] == true && body['treatment'] != null) {
        return List<Map<String, dynamic>>.from(body['treatment']);
      }
    }
    return [];
  }

  Future<bool> registerPatient(Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('${baseUrl}PatientUpdate'),
      headers: {
        'Authorization': 'Token $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data),
    );

    final body = jsonDecode(response.body);
    return response.statusCode == 200 && body['status'] == true;
  }
}
