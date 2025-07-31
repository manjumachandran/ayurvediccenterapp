import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:machne_test/screens/newRegistration_screen.dart';

class BookingListScreen extends StatelessWidget {
  const BookingListScreen({super.key});

  String formatDate(String inputDate) {
    DateTime date = DateFormat("MMMM d, yyyy").parse(inputDate);
    return DateFormat("dd/MM/yyyy").format(date);
  }

  @override
  Widget build(BuildContext context) {
    final bookings = [
      {
        'name': 'Vikram Singh',
        'package': 'Couple Combo Package (Rejuvenating)',
        'date': 'August 5, 2025',
        'person': 'Jithesh',
      },
      {
        'name': 'Aarav Mehta',
        'package': 'Solo Spa Package (Relax)',
        'date': 'August 6, 2025',
        'person': 'Anjali',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Back and notification
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

            // Search bar
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

            // Sort by row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Row(
                children: [
                  const Text(
                    "Sort by:",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(width: 250),
                 SizedBox(
  width: 150,
  height: 40, // You can adjust this width
  child: TextField(
    readOnly: true,
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal:10),
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

            // Booking cards
            Expanded(
              child: ListView.builder(
                itemCount: bookings.length,
                padding: const EdgeInsets.all(16),
                itemBuilder: (context, index) {
                  final booking = bookings[index];
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
                          // Name with index
                          Text(
                            '${index + 1}. ${booking['name']}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 6),

                          // Package in green
                          Text(
                            booking['package']!,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color(0xff006837),
                            ),
                          ),
                          const SizedBox(height: 10),

                          // Date & Person in one row
                          Row(
                            children: [
                              const Icon(Icons.calendar_today, size: 18, color: Colors.grey),
                              const SizedBox(width: 6),
                              Text(formatDate(booking['date']!)),
                              const SizedBox(width: 20),
                              const Icon(Icons.people, size: 18, color: Colors.grey),
                              const SizedBox(width: 6),
                              Text(booking['person']!),
                            ],
                          ),

                          const SizedBox(height: 12),
                          const Divider(),

                          // View booking details
                          InkWell(
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Viewing details for ${booking['name']}')),
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
          ],
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
