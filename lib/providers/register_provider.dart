import 'package:flutter/material.dart';
import 'package:machne_test/services/register_services.dart';

class PatientRegistrationProvider with ChangeNotifier {
  final RegisterService registerService;

  PatientRegistrationProvider({required this.registerService});

  List<Map<String, dynamic>> branches = [];
  List<Map<String, dynamic>> treatments = [];

  bool isLoading = false;

  Future<void> loadInitialData() async {
    isLoading = true;
    notifyListeners();

    branches = await registerService.getBranches();
    treatments = await registerService.getTreatments();

    isLoading = false;
    notifyListeners();
  }

  Future<bool> submitForm(Map<String, dynamic> formData) async {
    isLoading = true;
    notifyListeners();

    final success = await registerService.registerPatient(formData);

    isLoading = false;
    notifyListeners();

    return success;
  }
}
