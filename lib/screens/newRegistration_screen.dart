import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:machne_test/screens/showAlertDialogue.dart';

class NewregistrationScreen extends StatefulWidget {
  const NewregistrationScreen({super.key});


  @override
  State<NewregistrationScreen> createState() => _NewregistrationScreenState();
}

class _NewregistrationScreenState extends State<NewregistrationScreen> {
  DateTime? _selectedDate;
TimeOfDay? _selectedTime;

TextEditingController _hourController = TextEditingController();
TextEditingController _minuteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: [
            // Back and Notification Row
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

            // Header
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Divider(),
            const SizedBox(height: 12),
            buildLabeledField("Name", "Enter name"),
            const SizedBox(height: 10),
            buildLabeledField("WhatsApp Number", "Enter WhatsApp number"),
            const SizedBox(height: 10),
            buildLabeledField("Address", "Enter address"),
            const SizedBox(height: 10),
            buildLabeledDropdown("Location", "Select location"),
            const SizedBox(height: 10),
            buildLabeledDropdown("Branch", "Select branch"),
            const SizedBox(height: 20),

            // Treatment Label
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Treatment",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            const SizedBox(height: 8),

            // Combined Card for Treatment
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xffF1F1F1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Package + Icons
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            '1. Package Selected: Rejuvenating Combo',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                        const Icon(Icons.edit, color: Color(0xff006837)),
                        const SizedBox(width: 10),
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(4),
                            child: Icon(Icons.close, color: Colors.white, size: 16),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Male/Female Count
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              const Text('Male: '),
                              const SizedBox(width: 8),
                              Container(
                                width: 40,
                                height: 40,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: const Text('1'),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              const Text('Female: '),
                              const SizedBox(width: 8),
                              Container(
                                width: 40,
                                height: 40,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: const Text('2'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Add Treatment Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: GestureDetector(
                 onTap: () => showAddTreatmentDialog(context),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  decoration: BoxDecoration(
                    color: const Color(0xff389A48),
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add, color: Colors.white),
                      SizedBox(width: 8),
                      Text(
                        'Add Treatments',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
            // Total Amount
buildLabeledField("Total Amount", ""),
const SizedBox(height: 10),

// Discount Amount
buildLabeledField("Discount Amount", ""),
const SizedBox(height: 10),

// Payment Option
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 24.0),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text("Payment Option", style: TextStyle(fontSize: 16)),
      Row(
        children: [
          buildRadioOption("Cash", "cash"),
          buildRadioOption("Card", "card"),
          buildRadioOption("UPI", "upi"),
        ],
      ),
    ],
  ),
),
const SizedBox(height: 10),

// Advance Amount
buildLabeledField("Advance Amount", ""),
const SizedBox(height: 10),

// Balance Amount
buildLabeledField("Balance Amount", ""),
const SizedBox(height: 10),

// Treatment Date
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 24.0),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text("Treatment Date", style: TextStyle(fontSize: 16)),
      const SizedBox(height: 8),
      GestureDetector(
        onTap: () async {
          final DateTime? picked = await showDatePicker(
            context: context,
            initialDate: _selectedDate ?? DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2101),
          );
          if (picked != null) {
            setState(() {
              _selectedDate = picked;
            });
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey),
          ),
          child: Row(
            children: [
              const Icon(Icons.calendar_today, size: 20, color: Colors.black54),
              const SizedBox(width: 10),
              Text(
                _selectedDate != null
                    ? "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}"
                    : "Select Date",
                style: const TextStyle(color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    ],
  ),
),

const SizedBox(height: 10),

// Treatment Time
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 24.0),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text("Treatment Time", style: TextStyle(fontSize: 16)),
      const SizedBox(height: 8),
      // GestureDetector(
      //   onTap: () async {
      //     final TimeOfDay? picked = await showTimePicker(
      //       context: context,
      //       initialTime: _selectedTime ?? TimeOfDay.now(),
      //     );
      //     if (picked != null) {
      //       setState(() {
      //         _selectedTime = picked;
      //         _hourController.text = picked.hour.toString().padLeft(2, '0');
      //         _minuteController.text = picked.minute.toString().padLeft(2, '0');
      //       });
      //     }
      //   },
      //   child: Container(
      //     padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      //     decoration: BoxDecoration(
      //       color: Colors.grey.shade200,
      //       borderRadius: BorderRadius.circular(10),
      //       border: Border.all(color: Colors.grey),
      //     ),
      //     // child: Row(
      //     //   children: const [
      //     //     Icon(Icons.access_time, size: 20, color: Colors.black54),
      //     //     SizedBox(width: 10),
      //     //     Text("Choose Time", style: TextStyle(color: Colors.black54)),
      //     //   ],
      //     // ),
      //   ),
      // ),
      const SizedBox(height: 10),
      Row(
        children: [
          Expanded(
            child: TextField(
              controller: _hourController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Hour",
                filled: true,
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              controller: _minuteController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Minute",
                filled: true,
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  ),
),

const SizedBox(height: 20),

// Save Button
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 24.0),
  child: SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () {
        // Handle Save logic
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff006837),
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: const Text("Save", style: TextStyle(color: Colors.white)),
    ),
  ),
),

          ],
        ),
      ),
    );
  }

  Widget buildLabeledField(String label, String hint) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, color: Colors.black),
        ),
        const SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Colors.grey.shade200,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey),
            ),
          ),
        ),
      ],
    ),
  );
}


  Widget buildLabeledDropdown(String label, String hint) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, color: Colors.black),
        ),
        const SizedBox(height: 8),
        TextField(
          readOnly: true,
          decoration: InputDecoration(
            hintText: hint,
            suffixIcon: const Icon(CupertinoIcons.chevron_down, size: 20),
            filled: true,
            fillColor: Colors.grey.shade200,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey),
            ),
          ),
        ),
      ],
    ),
  );
}
String _selectedPayment = "cash";

Widget buildRadioOption(String label, String value) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Radio<String>(
        value: value,
        groupValue: _selectedPayment,
        activeColor: const Color(0xff006837),
        onChanged: (val) {
          setState(() {
            _selectedPayment = val!;
          });
        },
      ),
      Text(label),
    ],
  );
}

}