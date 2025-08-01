import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:machne_test/screens/new_Registration_screen.dart';
import 'package:machne_test/providers/patient_provider.dart';
import 'package:machne_test/providers/login_provider.dart';

class PatientListScreen extends StatefulWidget {
  const PatientListScreen({super.key});

  @override
  State<PatientListScreen> createState() => _PatientListScreenState();
}

class _PatientListScreenState extends State<PatientListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final loginProvider = Provider.of<LoginProvider>(context, listen: false);
      final patientProvider = Provider.of<PatientProvider>(context, listen: false);

      final token = loginProvider.token;
      if (token != null) {
        patientProvider.fetchPatients(token);
      } else {
        print('⚠️ Token is null. Cannot fetch patients.');
      }
    });
  }

  String formatDate(String inputDate) {
    try {
      DateTime date = DateTime.parse(inputDate);
      return DateFormat("dd/MM/yyyy").format(date);
    } catch (_) {
      return inputDate;
    }
  }

  Future<void> _refreshPatients() async {
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    final patientProvider = Provider.of<PatientProvider>(context, listen: false);

    final token = loginProvider.token;
    if (token != null) {
      await patientProvider.fetchPatients(token);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Consumer<PatientProvider>(
          builder: (context, provider, _) {
            final patients = provider.patients;

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(Icons.arrow_back, size: 28),
                      ),
                      Stack(
                        children: [
                          const Icon(Icons.notifications_none, size: 28),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Container(
                              width: 10,
                              height: 10,
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: SizedBox(
                    height: 48,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                              prefixIcon: const Icon(Icons.search),
                              hintText: 'Search for treatments',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          height: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff006837),
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              'Search',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Sort by:",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 150,
                        height: 40,
                        child: TextField(
                          readOnly: true,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                            hintText: 'Date',
                            suffixIcon: const Icon(Icons.arrow_drop_down),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Divider(thickness: 1),
                ),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: _refreshPatients,
                    child: provider.isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : patients.isEmpty
                            ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    SizedBox(height: 12),
                                    Text(
                                      'No patients found.',
                                      style: TextStyle(fontSize: 16, color: Colors.grey),
                                    ),
                                  ],
                                ),
                              )
                            : ListView.builder(
                                itemCount: patients.length,
                                padding: const EdgeInsets.all(16),
                                itemBuilder: (context, index) {
                                  final patient = patients[index];
                                  final treatmentList = patient['patientdetails_set'] ?? [];
                                  final treatmentName = treatmentList.isNotEmpty
                                      ? treatmentList[0]['treatment_name'] ?? ''
                                      : '';

                                  return Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    elevation: 3,
                                    color: const Color(0xffF1F1F1),
                                    margin: const EdgeInsets.only(bottom: 20),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${index + 1}. ${patient['name']}',
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const SizedBox(height: 6),
                                          Text(
                                            treatmentName,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: Color(0xff006837),
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            children: [
                                              const Icon(Icons.calendar_today, size: 18, color: Colors.grey),
                                              const SizedBox(width: 6),
                                              Text(formatDate(patient['date_nd_time'] ?? '')),
                                            ],
                                          ),
                                          const SizedBox(height: 12),
                                          const Divider(),
                                          InkWell(
                                            onTap: () {
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(content: Text('Viewing details for ${patient['name']}')),
                                              );
                                            },
                                            child: const Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  'View booking details',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                Icon(Icons.arrow_forward_ios, size: 16, color: Color(0xff006837)),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        height: 50,
        width: MediaQuery.of(context).size.width * 0.8,
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const NewregistrationScreen()),
            );
          },
          backgroundColor: const Color(0xff006837),
          label: const Text(
            'Register Now',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
