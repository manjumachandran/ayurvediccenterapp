import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showAddTreatmentDialog(BuildContext context) {
  int maleCount = 0;
  int femaleCount = 0;

  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            backgroundColor: Colors.white, // Set white background
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
           
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Choose Treatment',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: 'Choose preferred treatment',
                      suffixIcon: const Icon(
                        CupertinoIcons.chevron_down_circle,
                        color: Color(0xff006837), // Green icon
                      ),
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
                  const SizedBox(height: 20),
                  const Text(
                    'Add Patients',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  const SizedBox(height: 16),

                  // Male Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Male", style: TextStyle(fontSize: 16)),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove_circle, color: Color(0xff006837)),
                            onPressed: () {
                              if (maleCount > 0) setState(() => maleCount--);
                            },
                          ),
                          Container(
                            width: 40,
                            height: 35,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Text(
                              '$maleCount',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add_circle, color: Color(0xff006837)),
                            onPressed: () => setState(() => maleCount++),
                          ),
                        ],
                      )
                    ],
                  ),

                  // Female Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Female", style: TextStyle(fontSize: 16)),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove_circle, color: Color(0xff006837)),
                            onPressed: () {
                              if (femaleCount > 0) setState(() => femaleCount--);
                            },
                          ),
                          Container(
                            width: 40,
                            height: 35,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Text(
                              '$femaleCount',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add_circle, color: Color(0xff006837)),
                            onPressed: () => setState(() => femaleCount++),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff006837),
                ),
                onPressed: () {
                  // TODO: handle save
                  Navigator.pop(context);
                },
                child: const Text("Save", style: TextStyle(color: Colors.white)),
              ),
            ],
          );
        },
      );
    },
  );
}
