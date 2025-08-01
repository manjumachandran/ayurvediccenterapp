import 'package:flutter/material.dart';
import 'package:machne_test/services/patient_service.dart';
import 'package:machne_test/providers/login_provider.dart';

class PatientProvider with ChangeNotifier {
  final PatientService _service = PatientService();

  List<dynamic> _patients = [];
  bool _isLoading = false;

  List<dynamic> get patients => _patients;
  bool get isLoading => _isLoading;

  Future<void> fetchPatients(String token) async {
    print('[PatientProvider] Fetching patients with token: $token');

    _isLoading = true;
    notifyListeners();

    try {
      final data = await _service.fetchPatients(token);
      _patients = data;
      print('[PatientProvider] Fetched ${data.length} patients');
    } catch (e) {
      print('[PatientProvider] Error fetching patients: $e');
      _patients = [];
    }

    _isLoading = false;
    notifyListeners();
  }
}
